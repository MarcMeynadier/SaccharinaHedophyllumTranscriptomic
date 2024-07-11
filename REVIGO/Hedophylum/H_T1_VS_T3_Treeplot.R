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
revigo.data <- rbind(c("GO:0000097","sulfur amino acid biosynthetic process",0.4753877262335075,1.6721100183514574,0.4617980577579239,0,"sulfur amino acid biosynthetic process"),
c("GO:0006082","organic acid metabolic process",8.895121929802153,0.5437129366833218,0.5903482241840751,0.61251244,"sulfur amino acid biosynthetic process"),
c("GO:0006412","translation",5.085673767131161,0.9222688203476079,0.5527906699190307,0.39396409,"sulfur amino acid biosynthetic process"),
c("GO:0009059","macromolecule biosynthetic process",15.258385035486357,0.46945326112775015,0.6587376695759913,0.56953202,"sulfur amino acid biosynthetic process"),
c("GO:0009066","aspartate family amino acid metabolic process",0.8335242561063357,0.5509074688805811,0.5516980754176546,0.66063227,"sulfur amino acid biosynthetic process"),
c("GO:0009067","aspartate family amino acid biosynthetic process",0.7067468781798288,0.583575861810416,0.4657676528540915,0.64913149,"sulfur amino acid biosynthetic process"),
c("GO:0016053","organic acid biosynthetic process",4.173911088262467,0.8667453920830168,0.4551818216758115,0.61893742,"sulfur amino acid biosynthetic process"),
c("GO:0044249","cellular biosynthetic process",24.389190152163454,0.47940381422279016,0.6207709354827494,0.66782618,"sulfur amino acid biosynthetic process"),
c("GO:0044283","small molecule biosynthetic process",6.034460163531009,0.7003968315145346,0.5520556830400412,0.392549,"sulfur amino acid biosynthetic process"),
c("GO:1901566","organonitrogen compound biosynthetic process",14.63667861962968,1.1685589752888854,0.6038423381663047,0.26208529,"sulfur amino acid biosynthetic process"),
c("GO:1901576","organic substance biosynthetic process",27.07678740968754,1.0371525879478156,0.6362847961511804,0.56219288,"sulfur amino acid biosynthetic process"),
c("GO:0006091","generation of precursor metabolites and energy",2.62835465282124,0.8018076918319963,0.8657775739358771,0.09500459,"generation of precursor metabolites and energy"),
c("GO:0006790","sulfur compound metabolic process",1.9505422206753265,1.059687761181327,0.8711754750068305,0.07750958,"sulfur compound metabolic process"),
c("GO:0008152","metabolic process",65.3565173451011,0.5324925262609468,1,-0,"metabolic process"),
c("GO:0009987","cellular process",79.12519251933975,0.3982191325548129,1,-0,"cellular process"),
c("GO:0010467","gene expression",9.706370753664654,0.6774168775687096,0.8653112086705553,0.0968997,"gene expression"),
c("GO:0015980","energy derivation by oxidation of organic compounds",1.3592204656440126,0.4238752750649395,0.8771507599136,0.08739706,"energy derivation by oxidation of organic compounds"),
c("GO:0043603","amide metabolic process",6.518961624921768,0.6635983093847462,0.8587586683318054,0.09076698,"amide metabolic process"),
c("GO:1901564","organonitrogen compound metabolic process",29.993834591427927,0.5273386086990232,0.799393513899416,0.18637799,"amide metabolic process"),
c("GO:0044237","cellular metabolic process",49.22533251163365,1.0396862247504393,0.8606844236613954,0.04864775,"cellular metabolic process"),
c("GO:0009058","biosynthetic process",28.23839282673206,0.6272959929161674,0.8829090736994322,0.14934071,"cellular metabolic process"),
c("GO:0044281","small molecule metabolic process",15.15473791824727,0.36184832601960887,0.8985215571006988,0.11353227,"cellular metabolic process"),
c("GO:0098660","inorganic ion transmembrane transport",2.8120629398541377,0.5642718647332616,0.9076321835796111,0.0109587,"inorganic ion transmembrane transport"),
c("GO:0006811","monoatomic ion transport",4.401907471506606,0.5159081022115846,0.9247796222039689,0.41209348,"inorganic ion transmembrane transport"),
c("GO:0034220","monoatomic ion transmembrane transport",3.707494071415495,0.4648869792587226,0.9046640091790817,0.50368514,"inorganic ion transmembrane transport"),
c("GO:0055085","transmembrane transport",13.53545668727302,0.31329403474692985,0.8952594243068406,0.5384965,"inorganic ion transmembrane transport"));

stuff <- data.frame(revigo.data);
names(stuff) <- revigo.names;

stuff$value <- as.numeric( as.character(stuff$value) );
stuff$frequency <- as.numeric( as.character(stuff$frequency) );
stuff$uniqueness <- as.numeric( as.character(stuff$uniqueness) );
stuff$dispensability <- as.numeric( as.character(stuff$dispensability) );

# by default, outputs to a PDF file
pdf( file="H_T1_VS_T3_treeplot.pdf", width=16, height=9 ) # width and height are in inches

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

