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
revigo.data <- rbind(c("GO:0044281","small molecule metabolic process",15.15473791824727,0.929651769964428,0.8674933088275472,0.0507484,"small molecule metabolic process"),
c("GO:0072522","purine-containing compound biosynthetic process",1.9841965171428693,1.223851113208352,0.5683557738020912,0,"purine-containing compound biosynthetic process"),
c("GO:0006139","nucleobase-containing compound metabolic process",23.636924490908086,0.6512844068599692,0.4950444012692839,0.57248272,"purine-containing compound biosynthetic process"),
c("GO:0006725","cellular aromatic compound metabolic process",26.410310601416047,0.5254879917452241,0.7128943552219421,0.21430308,"purine-containing compound biosynthetic process"),
c("GO:0006793","phosphorus metabolic process",13.171532602957267,0.6832289414856519,0.7522643527823785,0.12102482,"purine-containing compound biosynthetic process"),
c("GO:0018130","heterocycle biosynthetic process",13.771272921376537,0.7329996756717927,0.4736928327821922,0.53496242,"purine-containing compound biosynthetic process"),
c("GO:0019438","aromatic compound biosynthetic process",13.451580388199883,0.7420168060250156,0.47582829942245763,0.38403062,"purine-containing compound biosynthetic process"),
c("GO:0019637","organophosphate metabolic process",5.94718450776783,1.2214074411868805,0.5999664697097458,0.59904924,"purine-containing compound biosynthetic process"),
c("GO:0034654","nucleobase-containing compound biosynthetic process",11.392930641947556,0.7683902549774131,0.4440433588210534,0.56998917,"purine-containing compound biosynthetic process"),
c("GO:0046483","heterocycle metabolic process",26.396317359150885,0.5219662385369346,0.7129282006004896,0.27023854,"purine-containing compound biosynthetic process"),
c("GO:0055086","nucleobase-containing small molecule metabolic process",4.5204226165387285,0.7882869149683953,0.5871115835921293,0.29056141,"purine-containing compound biosynthetic process"),
c("GO:0072521","purine-containing compound metabolic process",2.595262480894418,1.344093581819785,0.6353875759043673,0.25896296,"purine-containing compound biosynthetic process"),
c("GO:0090407","organophosphate biosynthetic process",4.716540883816774,1.043255454717309,0.425465718753824,0.31086666,"purine-containing compound biosynthetic process"),
c("GO:1901137","carbohydrate derivative biosynthetic process",4.616841943085589,1.0907703490738683,0.5806636563921108,0.27238895,"purine-containing compound biosynthetic process"),
c("GO:1901362","organic cyclic compound biosynthetic process",14.3966447883804,0.7286696289338411,0.5101629859767741,0.46012145,"purine-containing compound biosynthetic process"),
c("GO:1901566","organonitrogen compound biosynthetic process",14.63667861962968,0.3030122898521444,0.5668535485934129,0.4936698,"purine-containing compound biosynthetic process"),
c("GO:1901135","carbohydrate derivative metabolic process",6.41604626743983,1.242452146530756,0.8545312059516127,0.06517039,"carbohydrate derivative metabolic process"),
c("GO:1901360","organic cyclic compound metabolic process",27.27731619259278,0.6128665542621458,0.8038332959296762,0.10739063,"carbohydrate derivative metabolic process"));

stuff <- data.frame(revigo.data);
names(stuff) <- revigo.names;

stuff$value <- as.numeric( as.character(stuff$value) );
stuff$frequency <- as.numeric( as.character(stuff$frequency) );
stuff$uniqueness <- as.numeric( as.character(stuff$uniqueness) );
stuff$dispensability <- as.numeric( as.character(stuff$dispensability) );

# by default, outputs to a PDF file
pdf( file="S_T1_VS_T2_Treeplot.pdf", width=16, height=9 ) # width and height are in inches

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

