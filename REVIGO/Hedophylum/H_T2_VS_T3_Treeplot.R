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
revigo.data <- rbind(c("GO:0000097","sulfur amino acid biosynthetic process",0.4753877262335075,1.8469477249328912,0.5716717975884682,0,"sulfur amino acid biosynthetic process"),
c("GO:0006082","organic acid metabolic process",8.895121929802153,0.5437129366833218,0.6658690462332177,0.61251244,"sulfur amino acid biosynthetic process"),
c("GO:0009066","aspartate family amino acid metabolic process",0.8335242561063357,0.5509074688805811,0.6325983083347048,0.66063227,"sulfur amino acid biosynthetic process"),
c("GO:0009067","aspartate family amino acid biosynthetic process",0.7067468781798288,0.583575861810416,0.5786421363389637,0.64913149,"sulfur amino acid biosynthetic process"),
c("GO:0016053","organic acid biosynthetic process",4.173911088262467,1.0326813993178685,0.5703824989224806,0.61893742,"sulfur amino acid biosynthetic process"),
c("GO:0044237","cellular metabolic process",49.22533251163365,0.3554019030792011,0.9102700706598471,0.15404898,"sulfur amino acid biosynthetic process"),
c("GO:0044283","small molecule biosynthetic process",6.034460163531009,0.8610818296184172,0.6650192013379407,0.392549,"sulfur amino acid biosynthetic process"),
c("GO:1901564","organonitrogen compound metabolic process",29.993834591427927,0.5273386086990232,0.8773688524431605,0.11190784,"sulfur amino acid biosynthetic process"),
c("GO:1901566","organonitrogen compound biosynthetic process",14.63667861962968,0.43919819194439746,0.7493244212115991,0.26208529,"sulfur amino acid biosynthetic process"),
c("GO:1901576","organic substance biosynthetic process",27.07678740968754,0.3693179286072255,0.7806322885985851,0.56219288,"sulfur amino acid biosynthetic process"),
c("GO:0006091","generation of precursor metabolites and energy",2.62835465282124,0.8018076918319963,0.9073368285578826,0.09500459,"generation of precursor metabolites and energy"),
c("GO:0006790","sulfur compound metabolic process",1.9505422206753265,1.059687761181327,0.9109084089527538,0.07750958,"sulfur compound metabolic process"),
c("GO:0007154","cell communication",8.661893464294382,0.851922023237494,0.9807093886406353,0.01353463,"cell communication"),
c("GO:0009987","cellular process",79.12519251933975,0.5975511803812137,1,-0,"cellular process"),
c("GO:0015698","inorganic anion transport",0.9322319949846516,1.0584438482682899,0.9512937908093378,-0,"inorganic anion transport"),
c("GO:0006817","phosphate ion transport",0.30014789529928176,0.5166295478351316,0.956076617139611,0.2631356,"inorganic anion transport"),
c("GO:0055085","transmembrane transport",13.53545668727302,0.636425622989554,0.9200058663577834,0.49518182,"inorganic anion transport"),
c("GO:0098660","inorganic ion transmembrane transport",2.8120629398541377,0.32642067823700904,0.9309879342010375,0.33452738,"inorganic anion transport"),
c("GO:0015980","energy derivation by oxidation of organic compounds",1.3592204656440126,0.4238752750649395,0.9148805976911936,0.08739706,"energy derivation by oxidation of organic compounds"),
c("GO:0023052","signaling",8.271383217529026,0.545118569364387,0.9232952786206415,-0,"signaling"),
c("GO:0050789","regulation of biological process",22.28177859663912,0.46044719211772533,0.9113642044228616,0.56543827,"signaling"),
c("GO:0044281","small molecule metabolic process",15.15473791824727,0.36184832601960887,0.9377580957943215,0.04072701,"small molecule metabolic process"),
c("GO:0050896","response to stimulus",14.674014998147983,1.3880856019928933,1,-0,"response to stimulus"),
c("GO:0051179","localization",18.792076186036212,0.5574951460581747,1,-0,"localization"),
c("GO:0065007","biological regulation",23.052697479340427,0.44184725003321185,1,-0,"biological regulation"),
c("GO:1990748","cellular detoxification",0.8428541930100178,1.0403958213970894,0.8290639328425184,0.0096546,"cellular detoxification"),
c("GO:0006979","response to oxidative stress",0.5712981471310761,0.638272163982407,0.891832869226255,0.32943569,"cellular detoxification"),
c("GO:0042221","response to chemical",3.5497133630507625,0.3828182162422073,0.8679191920715416,0.40359782,"cellular detoxification"),
c("GO:0051716","cellular response to stimulus",12.016805727629972,1.225775095131081,0.8312768107482004,0.60012237,"cellular detoxification"));

stuff <- data.frame(revigo.data);
names(stuff) <- revigo.names;

stuff$value <- as.numeric( as.character(stuff$value) );
stuff$frequency <- as.numeric( as.character(stuff$frequency) );
stuff$uniqueness <- as.numeric( as.character(stuff$uniqueness) );
stuff$dispensability <- as.numeric( as.character(stuff$dispensability) );

# by default, outputs to a PDF file
pdf( file="H_T2_VS_T3_treeplot.pdf", width=16, height=9 ) # width and height are in inches

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

