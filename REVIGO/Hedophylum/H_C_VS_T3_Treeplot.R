# A treemap R script produced by the Revigo server at http://revigo.irb.hr/
# If you found Revigo useful in your work, please cite the following reference:
# Supek F et al. "REVIGO summarizes and visualizes long lists of Gene Ontology
# terms" PLoS ONE 2011. doi:10.1371/journal.pone.0021800

# author: Anton Kratz <anton.kratz@gmail.com>, RIKEN Omics Science Center, Functional Genomics Technology Team, Japan
# created: Fri, Nov 02, 2012  7:25:52 PM
# last change: Fri, Nov 09, 2012  3:20:01 PM

# -----------------------------------------------------------------------------
# If you don't have the treemap package installed, uncomment the following line:
# install.packages( "treemap" );
library(treemap) 								# treemap package by Martijn Tennekes

# Set the working directory if necessary
# setwd("C:/Users/username/workingdir");

# --------------------------------------------------------------------------
# Here is your data from Revigo. Scroll down for plot configuration options.

revigo.names <- c("term_ID","description","frequency","value","uniqueness","dispensability","representative");
revigo.data <- rbind(c("GO:0006091","generation of precursor metabolites and energy",2.62835465282124,1.0582550850508752,0.8831772949933698,0.0676671,"generation of precursor metabolites and energy"),
c("GO:0006414","translational elongation",0.45853729473473576,1.0076586004423747,0.6772770557697786,0.07976143,"translational elongation"),
c("GO:0006412","translation",5.085673767131161,1.6197706630619626,0.5688625024927815,0.66980486,"translational elongation"),
c("GO:0009059","macromolecule biosynthetic process",15.258385035486357,1.0540835642542068,0.6725108820558322,0.33214411,"translational elongation"),
c("GO:0010467","gene expression",9.706370753664654,0.9522774364067651,0.8535687900969018,0.29468075,"translational elongation"),
c("GO:0019538","protein metabolic process",18.67385374490695,2.3445734122540816,0.7467049539083533,0.23871088,"translational elongation"),
c("GO:0044249","cellular biosynthetic process",24.389190152163454,0.6605127830473448,0.6553602013411214,0.66782618,"translational elongation"),
c("GO:0044271","cellular nitrogen compound biosynthetic process",18.93399433857433,0.6797809912370048,0.6299442747876409,0.61091007,"translational elongation"),
c("GO:1901564","organonitrogen compound metabolic process",29.993834591427927,0.7409319882376819,0.806558359390033,0.25443166,"translational elongation"),
c("GO:1901566","organonitrogen compound biosynthetic process",14.63667861962968,0.9626571815344467,0.6535163573217708,0.50121883,"translational elongation"),
c("GO:1901576","organic substance biosynthetic process",27.07678740968754,0.9471329902458194,0.6590029331374224,0.56953202,"translational elongation"),
c("GO:0006457","protein folding",1.0590625918025878,1.5086102880706946,0.9858346725004642,0.00846668,"protein folding"),
c("GO:0006790","sulfur compound metabolic process",1.9505422206753265,0.620036738839665,0.8881161033055086,0.09500459,"sulfur compound metabolic process"),
c("GO:0008152","metabolic process",65.3565173451011,0.5852204574193722,1,-0,"metabolic process"),
c("GO:0009987","cellular process",79.12519251933975,0.318455766987809,1,-0,"cellular process"),
c("GO:0015980","energy derivation by oxidation of organic compounds",1.3592204656440126,0.8584436258757309,0.8480982231764427,0.09068117,"energy derivation by oxidation of organic compounds"),
c("GO:0043603","amide metabolic process",6.518961624921768,1.975268110344751,0.8710395620043397,0.09036333,"amide metabolic process"),
c("GO:0044237","cellular metabolic process",49.22533251163365,0.6482983672542854,0.8580471119218379,0.06778182,"cellular metabolic process"),
c("GO:0009058","biosynthetic process",28.23839282673206,0.47601694615777285,0.8847999987804124,0.14934071,"cellular metabolic process"),
c("GO:0043170","macromolecule metabolic process",38.34861513800723,0.33539750755512526,0.8453334481581443,0.17675389,"cellular metabolic process"),
c("GO:0046500","S-adenosylmethionine metabolic process",0.09139679366822917,1.5461620409169552,0.8474071914102682,0,"S-adenosylmethionine metabolic process"),
c("GO:0006556","S-adenosylmethionine biosynthetic process",0.05360805457278003,1.384776131868172,0.7797807955892112,0.53139023,"S-adenosylmethionine metabolic process"),
c("GO:0044272","sulfur compound biosynthetic process",1.2460139050319528,0.8746065780218151,0.7155343750307948,0.67825539,"S-adenosylmethionine metabolic process"),
c("GO:0098660","inorganic ion transmembrane transport",2.8120629398541377,1.1316612620409356,0.8730161707214703,0.01203986,"inorganic ion transmembrane transport"),
c("GO:0006811","monoatomic ion transport",4.401907471506606,1.0337456000650995,0.8987167761485992,0.41209348,"inorganic ion transmembrane transport"),
c("GO:0034220","monoatomic ion transmembrane transport",3.707494071415495,0.9319477878877299,0.8286056386172531,0.50368514,"inorganic ion transmembrane transport"));

stuff <- data.frame(revigo.data);
names(stuff) <- revigo.names;

stuff$value <- as.numeric( as.character(stuff$value) );
stuff$frequency <- as.numeric( as.character(stuff$frequency) );
stuff$uniqueness <- as.numeric( as.character(stuff$uniqueness) );
stuff$dispensability <- as.numeric( as.character(stuff$dispensability) );

# by default, outputs to a PDF file
pdf( file="H_C_VS_T3_treeplot.pdf", width=16, height=9 ) # width and height are in inches

# check the tmPlot command documentation for all possible parameters - there are a lot more
treemap(
  stuff,
  index = c("representative","description"),
  vSize = "value",
  type = "categorical",
  vColor = "representative",
  title = "Revigo TreeMap",
  inflate.labels = FALSE,      # set this to TRUE for space-filling group labels - good for posters
  lowerbound.cex.labels = 0,   # try to draw as many labels as possible (still, some small squares may not get a label)
  bg.labels = "#CCCCCCAA",   # define background color of group labels
								 # "#CCCCCC00" is fully transparent, "#CCCCCCAA" is semi-transparent grey, NA is opaque
  position.legend = "none"
)

dev.off()

