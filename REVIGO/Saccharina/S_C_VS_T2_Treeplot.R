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
revigo.data <- rbind(c("GO:0006091","generation of precursor metabolites and energy",2.62835465282124,3.1023729087095586,0.870468812949134,0,"generation of precursor metabolites and energy"),
c("GO:0006414","translational elongation",0.45853729473473576,0.3570174054980883,0.7122212917577037,0.3525854,"generation of precursor metabolites and energy"),
c("GO:0019538","protein metabolic process",18.67385374490695,0.8909481899484226,0.7248612548005271,0.31635035,"generation of precursor metabolites and energy"),
c("GO:0043170","macromolecule metabolic process",38.34861513800723,0.3471022224675553,0.8361807523858785,0.20088823,"generation of precursor metabolites and energy"),
c("GO:0044271","cellular nitrogen compound biosynthetic process",18.93399433857433,0.5886884494233614,0.6235602185795502,0.38211295,"generation of precursor metabolites and energy"),
c("GO:0055086","nucleobase-containing small molecule metabolic process",4.5204226165387285,0.7882869149683953,0.7224826137020548,0.10686008,"generation of precursor metabolites and energy"),
c("GO:0072521","purine-containing compound metabolic process",2.595262480894418,0.46663218365653686,0.7240523228603282,0.29056141,"generation of precursor metabolites and energy"),
c("GO:0072522","purine-containing compound biosynthetic process",1.9841965171428693,0.5761367197757676,0.6650081150220146,0.27944364,"generation of precursor metabolites and energy"),
c("GO:1901564","organonitrogen compound metabolic process",29.993834591427927,1.1929861673383626,0.7835566122162662,0.17051218,"generation of precursor metabolites and energy"),
c("GO:1901566","organonitrogen compound biosynthetic process",14.63667861962968,0.3059329576249306,0.6414524883306021,0.50610956,"generation of precursor metabolites and energy"),
c("GO:0006457","protein folding",1.0590625918025878,0.6950121280150687,0.9851422820541959,0.0119405,"protein folding"),
c("GO:0006811","monoatomic ion transport",4.401907471506606,0.8035695603593604,0.9240330968543871,-0,"monoatomic ion transport"),
c("GO:0034220","monoatomic ion transmembrane transport",3.707494071415495,0.5939693499180914,0.9099313754445715,0.42984343,"monoatomic ion transport"),
c("GO:0055085","transmembrane transport",13.53545668727302,1.1221681085071062,0.8979563723930988,0.5384965,"monoatomic ion transport"),
c("GO:0018193","peptidyl-amino acid modification",2.047197706052904,0.7895396819600116,0.7855462423501256,0.03914793,"peptidyl-amino acid modification"),
c("GO:0006508","proteolysis",5.350747086797883,0.5190765417649881,0.7562791692120633,0.40040007,"peptidyl-amino acid modification"),
c("GO:0019693","ribose phosphate metabolic process",2.299871024016621,0.7154339227330264,0.6089316660376797,0.0971165,"ribose phosphate metabolic process"),
c("GO:0019637","organophosphate metabolic process",5.94718450776783,0.3687125239435864,0.682929283712379,0.53380606,"ribose phosphate metabolic process"),
c("GO:0022900","electron transport chain",1.6021713573797571,0.6071659227644848,0.8788257743033707,0.09259975,"electron transport chain"),
c("GO:0051179","localization",18.792076186036212,0.6294369518305356,1,-0,"localization"),
c("GO:1901135","carbohydrate derivative metabolic process",6.41604626743983,0.3850342720378737,0.8852735216887214,0.06547741,"carbohydrate derivative metabolic process"));

stuff <- data.frame(revigo.data);
names(stuff) <- revigo.names;

stuff$value <- as.numeric( as.character(stuff$value) );
stuff$frequency <- as.numeric( as.character(stuff$frequency) );
stuff$uniqueness <- as.numeric( as.character(stuff$uniqueness) );
stuff$dispensability <- as.numeric( as.character(stuff$dispensability) );

# by default, outputs to a PDF file
pdf( file="S_C_VS_T2_Treeplot.pdf", width=16, height=9 ) # width and height are in inches

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

