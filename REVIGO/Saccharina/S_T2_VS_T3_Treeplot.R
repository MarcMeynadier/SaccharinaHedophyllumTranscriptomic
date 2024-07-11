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
revigo.data <- rbind(c("GO:0009987","cellular process",79.12519251933975,0.3089777741005573,1,-0,"cellular process"),
c("GO:0030001","metal ion transport",2.081427431784025,0.7533266533060027,0.9164041429263501,-0,"metal ion transport"),
c("GO:0055085","transmembrane transport",13.53545668727302,1.3413590941775742,0.9069630320488661,0.46981001,"metal ion transport"),
c("GO:0050896","response to stimulus",14.674014998147983,0.8939451599062136,1,-0,"response to stimulus"),
c("GO:0051179","localization",18.792076186036212,1.2303051936903844,1,-0,"localization"),
c("GO:1990748","cellular detoxification",0.8428541930100178,1.3398557839211127,0.48429752495213996,0,"cellular detoxification"),
c("GO:0006950","response to stress",4.90663876400189,0.34561165880942746,0.5467213347080293,0.51550886,"cellular detoxification"),
c("GO:0006979","response to oxidative stress",0.5712981471310761,0.5470120941061491,0.6320993157176307,0.32943569,"cellular detoxification"),
c("GO:0042221","response to chemical",3.5497133630507625,0.5427465445308218,0.5612838659421844,0.40359782,"cellular detoxification"),
c("GO:0051716","cellular response to stimulus",12.016805727629972,0.8040533246194013,0.5024186880187855,0.63796693,"cellular detoxification"));

stuff <- data.frame(revigo.data);
names(stuff) <- revigo.names;

stuff$value <- as.numeric( as.character(stuff$value) );
stuff$frequency <- as.numeric( as.character(stuff$frequency) );
stuff$uniqueness <- as.numeric( as.character(stuff$uniqueness) );
stuff$dispensability <- as.numeric( as.character(stuff$dispensability) );

# by default, outputs to a PDF file
pdf( file="S_T2_VS_T3_Treeplot.pdf", width=16, height=9 ) # width and height are in inches

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

