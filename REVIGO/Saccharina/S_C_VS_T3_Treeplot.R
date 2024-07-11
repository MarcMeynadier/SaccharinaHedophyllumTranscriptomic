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
revigo.data <- rbind(c("GO:0006091","generation of precursor metabolites and energy",2.62835465282124,0.8489287723857524,0.9012079805535839,0.07976143,"generation of precursor metabolites and energy"),
c("GO:0006414","translational elongation",0.45853729473473576,2.045103356886606,0.7191171663051614,0,"translational elongation"),
c("GO:0001172","RNA-templated transcription",0.03587618518471213,1.3102379881444948,0.8414929721713792,0.23925645,"translational elongation"),
c("GO:0006412","translation",5.085673767131161,3.495463352651212,0.6220490638178979,0.66980486,"translational elongation"),
c("GO:0009059","macromolecule biosynthetic process",15.258385035486357,3.5942417421802175,0.7205346774848062,0.51204972,"translational elongation"),
c("GO:0010467","gene expression",9.706370753664654,1.888992019834076,0.8578116475826768,0.29468075,"translational elongation"),
c("GO:0019538","protein metabolic process",18.67385374490695,6.919122171159858,0.7560633348640016,0.23871088,"translational elongation"),
c("GO:0019941","modification-dependent protein catabolic process",0.8274007574112628,0.337459275405227,0.8113194015395182,0.26812463,"translational elongation"),
c("GO:0034641","cellular nitrogen compound metabolic process",30.187049102942364,0.987146331446147,0.8006787275562326,0.30530756,"translational elongation"),
c("GO:0044249","cellular biosynthetic process",24.389190152163454,3.5254051320867434,0.7133396402112125,0.59014338,"translational elongation"),
c("GO:0044271","cellular nitrogen compound biosynthetic process",18.93399433857433,3.925616607396592,0.6917985421284201,0.30270307,"translational elongation"),
c("GO:1901564","organonitrogen compound metabolic process",29.993834591427927,4.773067735423382,0.8156770820785909,0.25443166,"translational elongation"),
c("GO:1901566","organonitrogen compound biosynthetic process",14.63667861962968,2.5580738779913026,0.6999918234967198,0.50610956,"translational elongation"),
c("GO:1901576","organic substance biosynthetic process",27.07678740968754,2.618916883095608,0.7178515574404378,0.66782618,"translational elongation"),
c("GO:0006457","protein folding",1.0590625918025878,1.4999359594869985,0.9878690355532181,0.00984147,"protein folding"),
c("GO:0006811","monoatomic ion transport",4.401907471506606,1.6840437116451128,0.937977826929735,-0,"monoatomic ion transport"),
c("GO:0034220","monoatomic ion transmembrane transport",3.707494071415495,1.354695851230305,0.900765558925808,0.42984343,"monoatomic ion transport"),
c("GO:0098660","inorganic ion transmembrane transport",2.8120629398541377,0.7721068709592599,0.9188307715472575,0.50368514,"monoatomic ion transport"),
c("GO:0006979","response to oxidative stress",0.5712981471310761,0.5470124001802301,0.9196496063713421,-0,"response to oxidative stress"),
c("GO:0007264","small GTPase mediated signal transduction",0.33345626897253483,0.3832167554704519,0.8747377649598825,0.3013286,"response to oxidative stress"),
c("GO:0007265","Ras protein signal transduction",0.07726717799377551,0.3802112069680489,0.8704903731821495,0.48915419,"response to oxidative stress"),
c("GO:0042221","response to chemical",3.5497133630507625,0.30777554552473085,0.9077741402212164,0.38514006,"response to oxidative stress"),
c("GO:0070887","cellular response to chemical stimulus",1.7854239576547926,0.3190836096882208,0.8950064796612932,0.44473782,"response to oxidative stress"),
c("GO:0008152","metabolic process",65.3565173451011,0.9026114844572575,1,-0,"metabolic process"),
c("GO:0009987","cellular process",79.12519251933975,0.4085211177893732,1,-0,"cellular process"),
c("GO:0015980","energy derivation by oxidation of organic compounds",1.3592204656440126,0.7835743907188177,0.8729688795742506,0.09068117,"energy derivation by oxidation of organic compounds"),
c("GO:0023052","signaling",8.271383217529026,0.5601881095296173,0.9608933246429875,-0,"signaling"),
c("GO:0043170","macromolecule metabolic process",38.34861513800723,4.291198430431209,0.8585746782164007,0.06848872,"macromolecule metabolic process"),
c("GO:0006807","nitrogen compound metabolic process",48.837649518475466,1.1213996824235897,0.8738526823898862,0.17591958,"macromolecule metabolic process"),
c("GO:0009058","biosynthetic process",28.23839282673206,1.853875376648954,0.8945151263105755,0.13256613,"macromolecule metabolic process"),
c("GO:0044237","cellular metabolic process",49.22533251163365,0.8667310128729786,0.8664507215532002,0.20673508,"macromolecule metabolic process"),
c("GO:0043603","amide metabolic process",6.518961624921768,4.796877868652899,0.8776317657817388,0.09036333,"amide metabolic process"));

stuff <- data.frame(revigo.data);
names(stuff) <- revigo.names;

stuff$value <- as.numeric( as.character(stuff$value) );
stuff$frequency <- as.numeric( as.character(stuff$frequency) );
stuff$uniqueness <- as.numeric( as.character(stuff$uniqueness) );
stuff$dispensability <- as.numeric( as.character(stuff$dispensability) );

# by default, outputs to a PDF file
pdf( file="S_C_VS_T3_Treeplot.pdf", width=16, height=9 ) # width and height are in inches

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

