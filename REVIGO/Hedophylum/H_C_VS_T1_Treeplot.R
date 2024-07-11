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
revigo.data <- rbind(c("GO:0000097","sulfur amino acid biosynthetic process",0.4753877262335075,1.8469605478766684,0.4716543967091712,0,"sulfur amino acid biosynthetic process"),
c("GO:0006082","organic acid metabolic process",8.895121929802153,0.983478092916409,0.5746689173055536,0.44426927,"sulfur amino acid biosynthetic process"),
c("GO:0006468","protein phosphorylation",4.340892012483024,0.44240835347185065,0.6967241439879504,0.19868265,"sulfur amino acid biosynthetic process"),
c("GO:0006520","amino acid metabolic process",5.465247531707815,0.575346509521286,0.4808322096000492,0.6913116,"sulfur amino acid biosynthetic process"),
c("GO:0008652","amino acid biosynthetic process",2.8043395482354745,1.0982860813470818,0.4475597198364303,0.68373962,"sulfur amino acid biosynthetic process"),
c("GO:0009066","aspartate family amino acid metabolic process",0.8335242561063357,0.5509074688805811,0.5286643724891412,0.4420088,"sulfur amino acid biosynthetic process"),
c("GO:0016310","phosphorylation",7.474579996508841,0.31460816607854425,0.8167690033461033,0.62371761,"sulfur amino acid biosynthetic process"),
c("GO:0019538","protein metabolic process",18.67385374490695,0.509800968387672,0.7218634415647793,0.35014548,"sulfur amino acid biosynthetic process"),
c("GO:0043412","macromolecule modification",10.822311035682203,0.4460737886776865,0.864197410890678,0.22045786,"sulfur amino acid biosynthetic process"),
c("GO:0044283","small molecule biosynthetic process",6.034460163531009,0.7003966136527615,0.6181764291407451,0.61251244,"sulfur amino acid biosynthetic process"),
c("GO:1901564","organonitrogen compound metabolic process",29.993834591427927,0.4533176938173294,0.8250047026530892,0.11190784,"sulfur amino acid biosynthetic process"),
c("GO:0006091","generation of precursor metabolites and energy",2.62835465282124,0.6434613277184335,0.8659187809082162,0.09500459,"generation of precursor metabolites and energy"),
c("GO:0006793","phosphorus metabolic process",13.171532602957267,0.34337904193841406,0.8295534804931021,0.12703009,"generation of precursor metabolites and energy"),
c("GO:0006457","protein folding",1.0590625918025878,1.1915913768876876,0.9820572497881609,0.00987736,"protein folding"),
c("GO:0006790","sulfur compound metabolic process",1.9505422206753265,0.8930615492618217,0.871050426063766,0.07750958,"sulfur compound metabolic process"),
c("GO:0009056","catabolic process",6.059177012419161,0.4343189682681796,0.9244295985034326,0.06282687,"catabolic process"),
c("GO:0015980","energy derivation by oxidation of organic compounds",1.3592204656440126,0.4238757360849838,0.8767657774880867,0.08739706,"energy derivation by oxidation of organic compounds"),
c("GO:0044281","small molecule metabolic process",15.15473791824727,0.5402680507861014,0.9112884693495192,0.04072701,"small molecule metabolic process"),
c("GO:0098660","inorganic ion transmembrane transport",2.8120629398541377,1.131658909677672,0.8487327239347392,0.01203986,"inorganic ion transmembrane transport"),
c("GO:0006811","monoatomic ion transport",4.401907471506606,1.033746116389744,0.8739253945957133,0.41209348,"inorganic ion transmembrane transport"),
c("GO:0034220","monoatomic ion transmembrane transport",3.707494071415495,0.9319466739708198,0.8060715357365827,0.50368514,"inorganic ion transmembrane transport"),
c("GO:0055085","transmembrane transport",13.53545668727302,0.38532905551264585,0.8360320944950312,0.5384965,"inorganic ion transmembrane transport"));

stuff <- data.frame(revigo.data);
names(stuff) <- revigo.names;

stuff$value <- as.numeric( as.character(stuff$value) );
stuff$frequency <- as.numeric( as.character(stuff$frequency) );
stuff$uniqueness <- as.numeric( as.character(stuff$uniqueness) );
stuff$dispensability <- as.numeric( as.character(stuff$dispensability) );

# by default, outputs to a PDF file
pdf( file="H_C_VS_T1_treeplot.pdf", width=16, height=9 ) # width and height are in inches

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

