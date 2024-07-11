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
revigo.data <- rbind(c("GO:0005975","carbohydrate metabolic process",5.521546466478484,0.35661543412546903,0.8878835339656664,0.08327525,"carbohydrate metabolic process"),
c("GO:0006811","monoatomic ion transport",4.401907471506606,1.0337456000650995,0.9368244037504695,0,"monoatomic ion transport"),
c("GO:0034220","monoatomic ion transmembrane transport",3.707494071415495,0.9319477878877299,0.9198124965089509,0.42984343,"monoatomic ion transport"),
c("GO:0055085","transmembrane transport",13.53545668727302,0.4521699348214782,0.911708323937874,0.5384965,"monoatomic ion transport"),
c("GO:0098660","inorganic ion transmembrane transport",2.8120629398541377,0.32642067823700904,0.9223415437820497,0.50368514,"monoatomic ion transport"),
c("GO:0008152","metabolic process",65.3565173451011,0.3842897703389928,1,-0,"metabolic process"),
c("GO:0009058","biosynthetic process",28.23839282673206,0.43322675179875214,0.8853842844570147,0.09351135,"biosynthetic process"),
c("GO:0006807","nitrogen compound metabolic process",48.837649518475466,0.31484159258232436,0.8645984399877705,0.22128816,"biosynthetic process"),
c("GO:0044238","primary metabolic process",54.063119334849006,0.4088908522338173,0.8601056397000303,0.15678936,"biosynthetic process"),
c("GO:0018193","peptidyl-amino acid modification",2.047197706052904,0.9181883966201059,0.784800107721582,0.05670879,"peptidyl-amino acid modification"),
c("GO:0006414","translational elongation",0.45853729473473576,0.7185643577394225,0.687790967826683,0.29431777,"peptidyl-amino acid modification"),
c("GO:0006418","tRNA aminoacylation for protein translation",0.974318159563009,0.45390419873317484,0.6018442493055934,0.56454341,"peptidyl-amino acid modification"),
c("GO:0006520","amino acid metabolic process",5.465247531707815,0.43040139234890545,0.6978466123454923,0.59635002,"peptidyl-amino acid modification"),
c("GO:0009059","macromolecule biosynthetic process",15.258385035486357,1.0576644883373616,0.7194513485839499,0.20486237,"peptidyl-amino acid modification"),
c("GO:0010467","gene expression",9.706370753664654,0.7854819950201596,0.8442797829045714,0.28055017,"peptidyl-amino acid modification"),
c("GO:0019538","protein metabolic process",18.67385374490695,0.6949002502343435,0.7114314056584692,0.33214411,"peptidyl-amino acid modification"),
c("GO:0034641","cellular nitrogen compound metabolic process",30.187049102942364,0.7323965393165471,0.776094726105518,0.30530756,"peptidyl-amino acid modification"),
c("GO:0034660","ncRNA metabolic process",3.769763500568378,0.5033705891308075,0.7496608764219089,0.34556187,"peptidyl-amino acid modification"),
c("GO:0043038","amino acid activation",0.9991846865833046,0.35427520549941094,0.7524355136661137,0.59496536,"peptidyl-amino acid modification"),
c("GO:0043603","amide metabolic process",6.518961624921768,1.2347338941229895,0.8534156966287576,0.12584976,"peptidyl-amino acid modification"),
c("GO:0044249","cellular biosynthetic process",24.389190152163454,0.9160568592636398,0.7006826835140462,0.55144154,"peptidyl-amino acid modification"),
c("GO:0044271","cellular nitrogen compound biosynthetic process",18.93399433857433,0.43376290698312164,0.648267899636923,0.59014338,"peptidyl-amino acid modification"),
c("GO:0055086","nucleobase-containing small molecule metabolic process",4.5204226165387285,0.6692575860454979,0.7215074787014796,0.10498231,"peptidyl-amino acid modification"),
c("GO:0072521","purine-containing compound metabolic process",2.595262480894418,0.6046980749146497,0.755397845082129,0.29056141,"peptidyl-amino acid modification"),
c("GO:1901564","organonitrogen compound metabolic process",29.993834591427927,0.8434387346256829,0.7854116788240867,0.18637799,"peptidyl-amino acid modification"),
c("GO:1901566","organonitrogen compound biosynthetic process",14.63667861962968,0.7303703256424472,0.6679438368579599,0.50121883,"peptidyl-amino acid modification"),
c("GO:1901576","organic substance biosynthetic process",27.07678740968754,0.4183904958811687,0.715828007528798,0.66782618,"peptidyl-amino acid modification"),
c("GO:0019693","ribose phosphate metabolic process",2.299871024016621,0.9653915943676379,0.8057398363178058,-0,"ribose phosphate metabolic process"),
c("GO:0009141","nucleoside triphosphate metabolic process",0.762872851553353,0.3640821757057693,0.7288885235673651,0.61386709,"ribose phosphate metabolic process"),
c("GO:0019637","organophosphate metabolic process",5.94718450776783,0.38993740274345995,0.8001447854412209,0.53380606,"ribose phosphate metabolic process"),
c("GO:0044281","small molecule metabolic process",15.15473791824727,0.4680602090314609,0.9024889348713317,0.05207235,"small molecule metabolic process"),
c("GO:0050896","response to stimulus",14.674014998147983,0.3251544684352775,1,-0,"response to stimulus"),
c("GO:1901135","carbohydrate derivative metabolic process",6.41604626743983,0.40277445690260333,0.8948265521896288,0.06664641,"carbohydrate derivative metabolic process"),
c("GO:1990748","cellular detoxification",0.8428541930100178,0.9220764080650671,0.8584388093376147,0.01143507,"cellular detoxification"),
c("GO:0006979","response to oxidative stress",0.5712981471310761,0.638272163982407,0.9156218618785936,0.32943569,"cellular detoxification"),
c("GO:0042221","response to chemical",3.5497133630507625,0.6309363579262222,0.8983771117957404,0.40359782,"cellular detoxification"),
c("GO:0051716","cellular response to stimulus",12.016805727629972,0.359158953139323,0.8685743626870004,0.60012237,"cellular detoxification"));

stuff <- data.frame(revigo.data);
names(stuff) <- revigo.names;

stuff$value <- as.numeric( as.character(stuff$value) );
stuff$frequency <- as.numeric( as.character(stuff$frequency) );
stuff$uniqueness <- as.numeric( as.character(stuff$uniqueness) );
stuff$dispensability <- as.numeric( as.character(stuff$dispensability) );

# by default, outputs to a PDF file
pdf( file="H_T1_VS_T2_treeplot.pdf", width=16, height=9 ) # width and height are in inches

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

