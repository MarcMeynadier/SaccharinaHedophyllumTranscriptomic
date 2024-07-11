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
revigo.data <- rbind(c("GO:0000097","sulfur amino acid biosynthetic process",0.4753877262335075,1.2523551806717517,0.5995476219952025,0.00721518,"sulfur amino acid biosynthetic process"),
c("GO:0006414","translational elongation",0.45853729473473576,1.0076586004423747,0.7049380999222833,0.30565017,"sulfur amino acid biosynthetic process"),
c("GO:0006468","protein phosphorylation",4.340892012483024,0.6645802145866276,0.76144486348302,0.32027556,"sulfur amino acid biosynthetic process"),
c("GO:0009059","macromolecule biosynthetic process",15.258385035486357,0.5482565356668755,0.717505335021589,0.50121883,"sulfur amino acid biosynthetic process"),
c("GO:0009066","aspartate family amino acid metabolic process",0.8335242561063357,0.5509074688805811,0.6828557036837142,0.67656516,"sulfur amino acid biosynthetic process"),
c("GO:0010467","gene expression",9.706370753664654,0.7100544838233321,0.8884579374742145,0.12284429,"sulfur amino acid biosynthetic process"),
c("GO:0016310","phosphorylation",7.474579996508841,0.4726227593113076,0.8592448028760719,0.62371761,"sulfur amino acid biosynthetic process"),
c("GO:0019538","protein metabolic process",18.67385374490695,1.1492680169674065,0.7597312351120995,0.35014548,"sulfur amino acid biosynthetic process"),
c("GO:0043170","macromolecule metabolic process",38.34861513800723,0.5220139132762343,0.884594580457122,0.20088823,"sulfur amino acid biosynthetic process"),
c("GO:0043603","amide metabolic process",6.518961624921768,1.0281769880886455,0.8905321416822108,0.18637799,"sulfur amino acid biosynthetic process"),
c("GO:0043604","amide biosynthetic process",5.857400911746049,1.2803455988016106,0.6653865894233827,0.6208586,"sulfur amino acid biosynthetic process"),
c("GO:0044249","cellular biosynthetic process",24.389190152163454,0.49134775320514945,0.6942098573988112,0.55144154,"sulfur amino acid biosynthetic process"),
c("GO:0044271","cellular nitrogen compound biosynthetic process",18.93399433857433,0.3995041104950825,0.6722755106538908,0.59014338,"sulfur amino acid biosynthetic process"),
c("GO:0044283","small molecule biosynthetic process",6.034460163531009,0.3486929047557773,0.6928885664488316,0.5211708,"sulfur amino acid biosynthetic process"),
c("GO:1901564","organonitrogen compound metabolic process",29.993834591427927,1.1004202312483935,0.8439855316288687,0.11190784,"sulfur amino acid biosynthetic process"),
c("GO:1901566","organonitrogen compound biosynthetic process",14.63667861962968,0.9668940391286854,0.6800252890344701,0.46837375,"sulfur amino acid biosynthetic process"),
c("GO:1901576","organic substance biosynthetic process",27.07678740968754,0.4558835655319974,0.709039150726502,0.66782618,"sulfur amino acid biosynthetic process"),
c("GO:1901605","alpha-amino acid metabolic process",3.5585210895822956,0.5118837952735734,0.6411975854505033,0.51588056,"sulfur amino acid biosynthetic process"),
c("GO:0006091","generation of precursor metabolites and energy",2.62835465282124,0.3678465164893673,0.8945710408009726,0.09500459,"generation of precursor metabolites and energy"),
c("GO:0006457","protein folding",1.0590625918025878,1.239645380391584,0.9832990491286956,0.00987736,"protein folding"),
c("GO:0006790","sulfur compound metabolic process",1.9505422206753265,0.5898860990864722,0.8987993527417556,0.07750958,"sulfur compound metabolic process"),
c("GO:0007021","tubulin complex assembly",0.022242170436692937,1.3222197290286184,0.8700754437962397,0.00588505,"tubulin complex assembly"),
c("GO:0006334","nucleosome assembly",0.09057190085107651,0.7533266533060027,0.8496725491722773,0.54216651,"tubulin complex assembly"),
c("GO:0022607","cellular component assembly",2.5732697740112993,1.1937521728042095,0.840316708311187,0.47909884,"tubulin complex assembly"),
c("GO:0034728","nucleosome organization",0.09438037776897892,0.7269987279362623,0.8556511486571943,0.67893359,"tubulin complex assembly"),
c("GO:0043933","protein-containing complex organization",2.6611873826523444,0.5311743228728963,0.8546886576391051,0.64626874,"tubulin complex assembly"),
c("GO:0044085","cellular component biogenesis",4.796572117984153,0.7304006724606216,0.8563394713727436,0.63827793,"tubulin complex assembly"),
c("GO:0065004","protein-DNA complex assembly",0.1970396193359134,0.6425606836861009,0.8427240861384064,0.66833899,"tubulin complex assembly"),
c("GO:0007023","post-chaperonin tubulin folding pathway",0.02748423124246953,1.5797801222748522,0.9883465375969931,0,"post-chaperonin tubulin folding pathway"),
c("GO:0007154","cell communication",8.661893464294382,0.41795255393165576,0.9777023434581711,0.01624466,"cell communication"),
c("GO:0009987","cellular process",79.12519251933975,0.3211184950379713,1,-0,"cellular process"),
c("GO:0015980","energy derivation by oxidation of organic compounds",1.3592204656440126,0.4238752750649395,0.9034806936469275,0.08739706,"energy derivation by oxidation of organic compounds"),
c("GO:0050790","regulation of catalytic activity",0.6743565303837294,1.1459856104446353,0.969405037046555,-0,"regulation of catalytic activity"),
c("GO:0007165","signal transduction",8.135788134528843,0.42372086088641503,0.9389088431644134,0.46662669,"regulation of catalytic activity"),
c("GO:0023052","signaling",8.271383217529026,0.545118569364387,0.9604941439943318,0.30934204,"regulation of catalytic activity"),
c("GO:0065009","regulation of molecular function",0.8166305842582776,1.0300113086427087,0.9688299161291769,0.23026939,"regulation of catalytic activity"),
c("GO:0071840","cellular component organization or biogenesis",9.440442605554349,0.30258058599369564,0.9773923272725663,0.02033788,"cellular component organization or biogenesis"),
c("GO:0098660","inorganic ion transmembrane transport",2.8120629398541377,0.7403058006432529,0.9167452569592176,0.01203986,"inorganic ion transmembrane transport"),
c("GO:0006811","monoatomic ion transport",4.401907471506606,0.6543107118234198,0.941194935154322,0.41209348,"inorganic ion transmembrane transport"),
c("GO:0034220","monoatomic ion transmembrane transport",3.707494071415495,0.5662429631544852,0.8901333509307787,0.50368514,"inorganic ion transmembrane transport"));

stuff <- data.frame(revigo.data);
names(stuff) <- revigo.names;

stuff$value <- as.numeric( as.character(stuff$value) );
stuff$frequency <- as.numeric( as.character(stuff$frequency) );
stuff$uniqueness <- as.numeric( as.character(stuff$uniqueness) );
stuff$dispensability <- as.numeric( as.character(stuff$dispensability) );

# by default, outputs to a PDF file
pdf( file="H_C_VS_T2_treeplot.pdf", width=16, height=9 ) # width and height are in inches

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

