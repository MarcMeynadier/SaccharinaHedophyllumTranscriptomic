# Differential expression on Kallisto data 

# Preliminary samples - 2016 dataset

# Packages and dependence
packageCheckClassic <- function(x){
  # 
  for( i in x ){
    if( ! require( i , character.only = TRUE ) ){
      install.packages( i , dependencies = TRUE )
      require( i , character.only = TRUE )
    }
  }
}

packageCheckClassic(c('DESeq2','adegenet','vsn','devtools','BiocManager','ggplot2','ggrepel','markdown','pheatmap','RColorBrewer','genefilter','gplots','vegan','dplyr','limma'))
#BiocManager::install('tximport', force = TRUE)
#BiocManager::install('apeglm')
#BiocManager::install('ashr')
#BiocManager::install("EnhancedVolcano")
#BiocManager::install("arrayQualityMetrics")
if (!require(devtools)) install.packages("devtools")
devtools::install_github("yanlinlin82/ggvenn")
library("adegenet")
library('ggvenn')
library('tximport')
library('apeglm')
library('ashr')
library('EnhancedVolcano')
library('BiocManager')
source_url("https://raw.githubusercontent.com/obigriffith/biostar-tutorials/master/Heatmaps/heatmap.3.R")

# Working environment and data loading
scriptPath<-dirname(rstudioapi::getSourceEditorContext()$path)
setwd(scriptPath)
#candidateGenes<-read.csv('candidateGenes.csv',header=T,sep=',')
samplesSaccharina<-read.table('saccharinaDesignSimple.txt',header=T)
samplesHedophylum<-read.table('hedophylumDesignSimple.txt',header=T)
dataPath<-'/Users/mmeynadier/Documents/kelpProject/kallistoOutput'
outputPath<-'/Users/mmeynadier/Documents/kelpProject/DESeq2Output'
#setwd(dataPath)

# DDS object

# If data from kallisto
tx2geneSaccharina<-read.table('Saccharina_tx2gene',header=T)
tx2geneHedophylum<-read.table('Hedophylum_tx2gene',header=T)


# 
# # Data importation - txImport
setwd(dataPath)
filesSaccharina<-paste0(samplesSaccharina$sample)
txiSaccharina<-tximport(files = filesSaccharina,type='kallisto',tx2gene = tx2geneSaccharina)
filesHedophylum<-paste0(samplesHedophylum$sample)
txiHedophylum<-tximport(files = filesHedophylum,type='kallisto',tx2gene = tx2geneHedophylum)

ddsSaccharina<-DESeqDataSetFromTximport(txiSaccharina,colData=samplesSaccharina,design= ~treatment)
ddsHedophylum<-DESeqDataSetFromTximport(txiHedophylum,colData=samplesHedophylum,design= ~treatment)
# pre-filtering
keepSaccharina <- rowSums(counts(ddsSaccharina)) >= 10 
ddsSaccharina <- ddsSaccharina[keepSaccharina,]
keepHedophylum <- rowSums(counts(ddsHedophylum)) >= 10 
ddsHedophylum <- ddsHedophylum[keepHedophylum,]

# Differential expression analysis
ddsSaccharina<-DESeq(ddsSaccharina)
cbind(resultsNames(ddsSaccharina))
ddsHedophylum<-DESeq(ddsHedophylum)
cbind(resultsNames(ddsHedophylum))



# Exploring the results - Saccharina

S_C_vs_T1 <- results(ddsSaccharina,contrast=c("treatment", "C", "T1"))
S_C_vs_T2 <- results(ddsSaccharina,contrast=c("treatment", "C", "T2"))
S_C_vs_T3 <- results(ddsSaccharina,contrast=c("treatment", "C", "T3"))
S_T1_vs_T2 <- results(ddsSaccharina,contrast=c("treatment", "T1", "T2"))
S_T1_vs_T3 <- results(ddsSaccharina,contrast=c("treatment", "T1", "T3"))
S_T2_vs_T3 <- results(ddsSaccharina,contrast=c("treatment", "T2", "T3"))

DESeq2::plotMA(S_C_vs_T1,ylim=c(-50,50),main="MA-plot for the shrunken log2 fold changes\nC vs T1")
DESeq2::plotMA(S_C_vs_T2,ylim=c(-50,50),main="MA-plot for the shrunken log2 fold changes\nC vs T2")
DESeq2::plotMA(S_C_vs_T3,ylim=c(-50,50),main="MA-plot for the shrunken log2 fold changes\nC vs T3")
DESeq2::plotMA(S_T1_vs_T2,ylim=c(-50,50),main="MA-plot for the shrunken log2 fold changes\nT1 vs T2")
DESeq2::plotMA(S_T1_vs_T3,ylim=c(-50,50),main="MA-plot for the shrunken log2 fold changes\nT1 vs T3")
DESeq2::plotMA(S_T2_vs_T3,ylim=c(-50,50),main="MA-plot for the shrunken log2 fold changes\nT2 vs T3")


vsdSaccharina <- vst(ddsSaccharina, blind=T)

meanSdPlot(assay(vsdSaccharina))

ntd <- normTransform(ddsSaccharina)
meanSdPlot(assay(ntd))

select <- order(rowMeans(counts(ddsSaccharina,normalized=TRUE)),
                decreasing=TRUE)[1:20]
df <- as.data.frame(colData(ddsSaccharina)[,"treatment"])
pheatmap(assay(vsdSaccharina)[select,], cluster_rows=FALSE, show_rownames=F,
         cluster_cols=FALSE, annotation_col=df)



pcaData <- plotPCA(vsdSaccharina, intgroup="treatment", returnData=TRUE)
percentVar <- round(100 * attr(pcaData, "percentVar"))
ggplot(pcaData, aes(PC1, PC2, color=treatment)) +
  geom_point(size=3) +
  xlab(paste0("PC1: ",percentVar[1],"% variance")) +
  ylab(paste0("PC2: ",percentVar[2],"% variance")) + 
  coord_fixed()


sampleDists <- dist(t(assay(vsdSaccharina)))
library("RColorBrewer")
sampleDistMatrix <- as.matrix(sampleDists)
rownames(sampleDistMatrix) <-vsdSaccharina$treatment
colnames(sampleDistMatrix) <- NULL
colors <- colorRampPalette( rev(brewer.pal(9, "Blues")) )(255)
pheatmap(sampleDistMatrix,
         clustering_distance_rows=sampleDists,
         clustering_distance_cols=sampleDists,
         col=colors)




# Hedophylum

H_C_vs_T1 <- results(ddsHedophylum,contrast=c("treatment", "C", "T1"))
H_C_vs_T2 <- results(ddsHedophylum,contrast=c("treatment", "C", "T2"))
H_C_vs_T3 <- results(ddsHedophylum,contrast=c("treatment", "C", "T3"))
H_T1_vs_T2 <- results(ddsHedophylum,contrast=c("treatment", "T1", "T2"))
H_T1_vs_T3 <- results(ddsHedophylum,contrast=c("treatment", "T1", "T3"))
H_T2_vs_T3 <- results(ddsHedophylum,contrast=c("treatment", "T2", "T3"))

DESeq2::plotMA(H_C_vs_T1,ylim=c(-50,50),main="MA-plot for the shrunken log2 fold changes\nC vs T1")
DESeq2::plotMA(H_C_vs_T2,ylim=c(-50,50),main="MA-plot for the shrunken log2 fold changes\nC vs T2")
DESeq2::plotMA(H_C_vs_T3,ylim=c(-50,50),main="MA-plot for the shrunken log2 fold changes\nC vs T3")
DESeq2::plotMA(H_T1_vs_T2,ylim=c(-50,50),main="MA-plot for the shrunken log2 fold changes\nT1 vs T2")
DESeq2::plotMA(H_T1_vs_T3,ylim=c(-50,50),main="MA-plot for the shrunken log2 fold changes\nT1 vs T3")
DESeq2::plotMA(H_T2_vs_T3,ylim=c(-50,50),main="MA-plot for the shrunken log2 fold changes\nT2 vs T3")


vsdHedophylum <- vst(ddsHedophylum, blind=T)

meanSdPlot(assay(vsdHedophylum))

ntd <- normTransform(ddsHedophylum)
meanSdPlot(assay(ntd))

select <- order(rowMeans(counts(ddsHedophylum,normalized=TRUE)),
                decreasing=TRUE)[1:20]
df <- as.data.frame(colData(ddsHedophylum)[,"treatment"])
pheatmap(assay(vsdHedophylum)[select,], cluster_rows=FALSE, show_rownames=F,
         cluster_cols=FALSE, annotation_col=df)



pcaData <- plotPCA(vsdHedophylum, intgroup="treatment", returnData=TRUE)
percentVar <- round(100 * attr(pcaData, "percentVar"))
ggplot(pcaData, aes(PC1, PC2, color=treatment)) +
  geom_point(size=3) +
  xlab(paste0("PC1: ",percentVar[1],"% variance")) +
  ylab(paste0("PC2: ",percentVar[2],"% variance")) + 
  coord_fixed()


sampleDists <- dist(t(assay(vsdHedophylum)))
library("RColorBrewer")
sampleDistMatrix <- as.matrix(sampleDists)
rownames(sampleDistMatrix) <- vsdHedophylum$treatment
colnames(sampleDistMatrix) <- NULL
colors <- colorRampPalette( rev(brewer.pal(9, "Blues")) )(255)
pheatmap(sampleDistMatrix,
         clustering_distance_rows=sampleDists,
         clustering_distance_cols=sampleDists,
         col=colors)


sessionInfo()
