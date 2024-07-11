library(venn)

# Working environment and data loading
scriptPath<-dirname(rstudioapi::getSourceEditorContext()$path)
setwd(scriptPath)
#candidateGenes<-read.csv('candidateGenes.csv',header=T,sep=',')
S_C_VS_T1<-read.table('Saccharina/S_C_VS_T1.csv',header=T,sep=',')
S_C_VS_T2<-read.table('Saccharina/S_C_VS_T2.csv',header=T,sep=',')
S_C_VS_T3<-read.table('Saccharina/S_C_VS_T3.csv',header=T,sep=',')
S_T1_VS_T2<-read.table('Saccharina/S_T1_VS_T2.csv',header=T,sep=',')
S_T1_VS_T3<-read.table('Saccharina/S_T1_VS_T3.csv',header=T,sep=',')
S_T2_VS_T3<-read.table('Saccharina/S_T2_VS_T3.csv',header=T,sep=',')

H_C_VS_T1<-read.table('Hedophylum/H_C_VS_T1.csv',header=T,sep=',')
H_C_VS_T2<-read.table('Hedophylum/H_C_VS_T2.csv',header=T,sep=',')
H_C_VS_T3<-read.table('Hedophylum/H_C_VS_T3.csv',header=T,sep=',')
H_T1_VS_T2<-read.table('Hedophylum/H_T1_VS_T2.csv',header=T,sep=',')
H_T1_VS_T3<-read.table('Hedophylum/H_T1_VS_T3.csv',header=T,sep=',')
H_T2_VS_T3<-read.table('Hedophylum/H_T2_VS_T3.csv',header=T,sep=',')


extractCol <- function(f,name,sign) {
if (sign == "pos") {
  f = f[f$log2FoldChange > 0,]
}
else {
  f = f[f$log2FoldChange < 0,]
}
write.table(f$X, file=name, sep = "\n",
            row.names = FALSE,col.names = FALSE)}

extractCol(S_C_VS_T1,"venn/S_C_VS_T1_pos.txt","pos")
extractCol(S_C_VS_T2,"venn/S_C_VS_T2_pos.txt","pos")
extractCol(S_C_VS_T3,"venn/S_C_VS_T3_pos.txt","pos")
extractCol(S_C_VS_T1,"venn/S_C_VS_T1_neg.txt","neg")
extractCol(S_C_VS_T2,"venn/S_C_VS_T2_neg.txt","neg")
extractCol(S_C_VS_T3,"venn/S_C_VS_T3_neg.txt","neg")

extractCol(S_T1_VS_T2,"venn/S_T1_VS_T2_pos.txt","pos")
extractCol(S_T1_VS_T3,"venn/S_T1_VS_T3_pos.txt","pos")
extractCol(S_T2_VS_T3,"venn/S_T2_VS_T3_pos.txt","pos")
extractCol(S_T1_VS_T2,"venn/S_T1_VS_T2_neg.txt","neg")
extractCol(S_T1_VS_T3,"venn/S_T1_VS_T3_neg.txt","neg")
extractCol(S_T2_VS_T3,"venn/S_T2_VS_T3_neg.txt","neg")

extractCol(H_C_VS_T1,"venn/H_C_VS_T1_pos.txt","pos")
extractCol(H_C_VS_T2,"venn/H_C_VS_T2_pos.txt","pos")
extractCol(H_C_VS_T3,"venn/H_C_VS_T3_pos.txt","pos")
extractCol(H_C_VS_T1,"venn/H_C_VS_T1_neg.txt","neg")
extractCol(H_C_VS_T2,"venn/H_C_VS_T2_neg.txt","neg")
extractCol(H_C_VS_T3,"venn/H_C_VS_T3_neg.txt","neg")

extractCol(H_T1_VS_T2,"venn/H_T1_VS_T2_pos.txt","pos")
extractCol(H_T1_VS_T3,"venn/H_T1_VS_T3_pos.txt","pos")
extractCol(H_T2_VS_T3,"venn/H_T2_VS_T3_pos.txt","pos")
extractCol(H_T1_VS_T2,"venn/H_T1_VS_T2_neg.txt","neg")
extractCol(H_T1_VS_T3,"venn/H_T1_VS_T3_neg.txt","neg")
extractCol(H_T2_VS_T3,"venn/H_T2_VS_T3_neg.txt","neg")

# C = #93c4de
# T1 = #0b70b0
# T2 = #f3a482
# T3 = #cb1c1f

# C vs T1 = #4F9AC7
# C vs T2 = #C3B4B0
# C vs T3 = #AF707F

# T1 vs T2 = #7F8A99
# T1 vs T3 = #6B4668
# T2 vs T3 = #DF6051
venn(3,snames = "C_VS_T1, C_VS_T2, C_VS_T3",zcolor = c("#4F9AC7","#C3B4B0","#AF707F"),opacity = 0.6,box=F)
venn(3,snames = "T1_VS_T2, T1_VS_T3, T2_VS_T3",zcolor = c("#7F8A99","#6B4668","#DF6051"),opacity = 0.6,box=F)

# barplot

library(tidyverse)
read_tsv("tmp.tsv", col_types = "ccci") %>%  
ggplot(aes(x=month, y=count, fill=type)) + geom_col() + facet_grid(.~id)



