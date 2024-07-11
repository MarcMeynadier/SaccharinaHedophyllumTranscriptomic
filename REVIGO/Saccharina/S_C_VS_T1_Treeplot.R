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
revigo.data <- rbind(c("GO:0006457","protein folding",1.0590625918025878,2.343997679317043,0.9944492079366227,0,"protein folding"),
c("GO:0009056","catabolic process",6.059177012419161,0.6393725106108807,0.8960223277273017,0.06991995,"catabolic process"),
c("GO:0009057","macromolecule catabolic process",2.3186905544982737,0.7046132521512654,0.5448668395028482,-0,"macromolecule catabolic process"),
c("GO:0006412","translation",5.085673767131161,0.3893132265438911,0.4761681301245678,0.46208387,"macromolecule catabolic process"),
c("GO:0006508","proteolysis",5.350747086797883,0.45426993082865563,0.6280269664285861,0.36604549,"macromolecule catabolic process"),
c("GO:0019538","protein metabolic process",18.67385374490695,0.9155738745070098,0.5982016079335011,0.21715385,"macromolecule catabolic process"),
c("GO:0030163","protein catabolic process",1.1278347042519765,0.6245668518300569,0.45800703804662996,0.65636613,"macromolecule catabolic process"),
c("GO:1901564","organonitrogen compound metabolic process",29.993834591427927,0.662177481036395,0.7251073280511637,0.25443166,"macromolecule catabolic process"),
c("GO:0043603","amide metabolic process",6.518961624921768,0.5068976165704281,0.809948626804208,0.07115478,"amide metabolic process"),
c("GO:0044249","cellular biosynthetic process",24.389190152163454,0.6629402736794755,0.6811366080635122,0.05694207,"cellular biosynthetic process"),
c("GO:0006807","nitrogen compound metabolic process",48.837649518475466,0.39032130100885293,0.8300759508392611,0.17591958,"cellular biosynthetic process"),
c("GO:0009059","macromolecule biosynthetic process",15.258385035486357,0.35493848242007736,0.6065818957493818,0.55144154,"cellular biosynthetic process"),
c("GO:0043170","macromolecule metabolic process",38.34861513800723,0.47269110594250585,0.7963535347488366,0.12436747,"cellular biosynthetic process"),
c("GO:0044271","cellular nitrogen compound biosynthetic process",18.93399433857433,0.35295559851313124,0.6194016774682066,0.59014338,"cellular biosynthetic process"),
c("GO:1901566","organonitrogen compound biosynthetic process",14.63667861962968,0.3047574264011313,0.5442675774075506,0.54455842,"cellular biosynthetic process"));

stuff <- data.frame(revigo.data);
names(stuff) <- revigo.names;

stuff$value <- as.numeric( as.character(stuff$value) );
stuff$frequency <- as.numeric( as.character(stuff$frequency) );
stuff$uniqueness <- as.numeric( as.character(stuff$uniqueness) );
stuff$dispensability <- as.numeric( as.character(stuff$dispensability) );

# by default, outputs to a PDF file
pdf( file="S_C_VS_T1_Treemap.pdf", width=16, height=9 ) # width and height are in inches

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

