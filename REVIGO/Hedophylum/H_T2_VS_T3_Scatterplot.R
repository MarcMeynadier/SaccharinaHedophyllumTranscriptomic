# A plotting R script produced by the Revigo server at http://revigo.irb.hr/
# If you found Revigo useful in your work, please cite the following reference:
# Supek F et al. "REVIGO summarizes and visualizes long lists of Gene Ontology
# terms" PLoS ONE 2011. doi:10.1371/journal.pone.0021800

# --------------------------------------------------------------------------
# If you don't have the ggplot2 package installed, uncomment the following line:
# install.packages( "ggplot2" );
library( ggplot2 );

# --------------------------------------------------------------------------
# If you don't have the scales package installed, uncomment the following line:
# install.packages( "scales" );
library( scales );

# --------------------------------------------------------------------------
# Here is your data from Revigo. Scroll down for plot configuration options.

revigo.names <- c("term_ID","description","frequency","plot_X","plot_Y","log_size","value","uniqueness","dispensability");
revigo.data <- rbind(c("GO:0000097","sulfur amino acid biosynthetic process",0.4753877262335075,7.079857780423191,-0.15235264817981273,5.15510516225765,-1.8469477249328912,0.5716717975884682,0),
c("GO:0006082","organic acid metabolic process",8.895121929802153,6.393542619815055,-1.8131461836105467,6.427206226819538,-0.5437129366833218,0.6658690462332177,0.61251244),
c("GO:0006091","generation of precursor metabolites and energy",2.62835465282124,6.0402250997305185,-5.838840194815027,5.897738674144431,-0.8018076918319963,0.9073368285578826,0.09500459),
c("GO:0006790","sulfur compound metabolic process",1.9505422206753265,4.168534142867215,-6.6982641103621345,5.768210254776623,-1.059687761181327,0.9109084089527538,0.07750958),
c("GO:0006817","phosphate ion transport",0.30014789529928176,-0.7665292403737487,6.189181394170741,4.955394273952119,-0.5166295478351316,0.956076617139611,0.2631356),
c("GO:0006979","response to oxidative stress",0.5712981471310761,-0.5468776817221014,-6.190069344860872,5.23491950292478,-0.638272163982407,0.891832869226255,0.32943569),
c("GO:0007154","cell communication",8.661893464294382,-4.169628475712722,5.066713583940737,6.415667163528361,-0.851922023237494,0.9807093886406353,0.01353463),
c("GO:0009066","aspartate family amino acid metabolic process",0.8335242561063357,6.9255575979135555,-1.066050284361533,5.398974134528076,-0.5509074688805811,0.6325983083347048,0.66063227),
c("GO:0009067","aspartate family amino acid biosynthetic process",0.7067468781798288,6.805111106475832,0.07514516391201607,5.327320101614222,-0.583575861810416,0.5786421363389637,0.64913149),
c("GO:0009987","cellular process",79.12519251933975,-4.155866332452945,-5.065006077410628,7.376368956838209,-0.5975511803812137,1,-0),
c("GO:0015698","inorganic anion transport",0.9322319949846516,0.29048498279833845,5.914165253951962,5.447579712626874,-1.0584438482682899,0.9512937908093378,-0),
c("GO:0015980","energy derivation by oxidation of organic compounds",1.3592204656440126,-0.08306994391246504,-1.052459252815491,5.611345126683129,-0.4238752750649395,0.9148805976911936,0.08739706),
c("GO:0016053","organic acid biosynthetic process",4.173911088262467,6.533924735095675,-0.32088347134527634,6.0985976985445784,-1.0326813993178685,0.5703824989224806,0.61893742),
c("GO:0023052","signaling",8.271383217529026,-5.736449847464501,0.560019367671576,6.395632475900429,-0.545118569364387,0.9232952786206415,-0),
c("GO:0042221","response to chemical",3.5497133630507625,0.010435598517094524,-6.601194320551167,6.028247851305722,-0.3828182162422073,0.8679191920715416,0.40359782),
c("GO:0044237","cellular metabolic process",49.22533251163365,4.486539027281587,6.392990136028507,7.170242846650484,-0.3554019030792011,0.9102700706598471,0.15404898),
c("GO:0044281","small molecule metabolic process",15.15473791824727,-4.716970462205184,3.204106805096776,6.658602684396198,-0.36184832601960887,0.9377580957943215,0.04072701),
c("GO:0044283","small molecule biosynthetic process",6.034460163531009,6.1390604993801645,0.04729040181829377,6.258692822898982,-0.8610818296184172,0.6650192013379407,0.392549),
c("GO:0050789","regulation of biological process",22.28177859663912,-5.735010801197,0.20636024705994774,6.826004078243962,-0.46044719211772533,0.9113642044228616,0.56543827),
c("GO:0050896","response to stimulus",14.674014998147983,-3.093041930467217,-2.2000743303966246,6.644603215942828,-1.3880856019928933,1,-0),
c("GO:0051179","localization",18.792076186036212,-5.556328275671091,-2.964250095193556,6.75202900021518,-0.5574951460581747,1,-0),
c("GO:0051716","cellular response to stimulus",12.016805727629972,0.0694687188021076,-6.1663548393346295,6.557843319194743,-1.225775095131081,0.8312768107482004,0.60012237),
c("GO:0055085","transmembrane transport",13.53545668727302,-0.053767932869177505,6.46408342004298,6.609527179077396,-0.636425622989554,0.9200058663577834,0.49518182),
c("GO:0065007","biological regulation",23.052697479340427,-1.7724409440575086,1.6573001543230448,6.8407759726007304,-0.44184725003321185,1,-0),
c("GO:0098660","inorganic ion transmembrane transport",2.8120629398541377,0.42394313517504756,6.681156011342027,5.9270797094445795,-0.32642067823700904,0.9309879342010375,0.33452738),
c("GO:1901564","organonitrogen compound metabolic process",29.993834591427927,5.822495817299042,4.904600700961288,6.955086199151694,-0.5273386086990232,0.8773688524431605,0.11190784),
c("GO:1901566","organonitrogen compound biosynthetic process",14.63667861962968,6.531127471572679,2.0081062489168513,6.643496794616454,-0.43919819194439746,0.7493244212115991,0.26208529),
c("GO:1901576","organic substance biosynthetic process",27.07678740968754,6.119512703801122,2.4071393042797555,6.910651347384342,-0.3693179286072255,0.7806322885985851,0.56219288),
c("GO:1990748","cellular detoxification",0.8428541930100178,0.6079718175921851,-6.378316016295723,5.403808324413346,-1.0403958213970894,0.8290639328425184,0.0096546));

one.data <- data.frame(revigo.data);
names(one.data) <- revigo.names;
one.data <- one.data [(one.data$plot_X != "null" & one.data$plot_Y != "null"), ];
one.data$plot_X <- as.numeric( as.character(one.data$plot_X) );
one.data$plot_Y <- as.numeric( as.character(one.data$plot_Y) );
one.data$log_size <- as.numeric( as.character(one.data$log_size) );
one.data$value <- as.numeric( as.character(one.data$value) );
one.data$frequency <- as.numeric( as.character(one.data$frequency) );
one.data$uniqueness <- as.numeric( as.character(one.data$uniqueness) );
one.data$dispensability <- as.numeric( as.character(one.data$dispensability) );
#head(one.data);


# --------------------------------------------------------------------------
# Names of the axes, sizes of the numbers and letters, names of the columns,
# etc. can be changed below

p1 <- ggplot( data = one.data );
p1 <- p1 + geom_point( aes( plot_X, plot_Y, colour = value, size = log_size), alpha = I(0.6) );
p1 <- p1 + scale_colour_gradientn( colours = c("blue", "green", "yellow", "red"), limits = c( min(one.data$value), 0) );
p1 <- p1 + geom_point( aes(plot_X, plot_Y, size = log_size), shape = 21, fill = "transparent", colour = I (alpha ("black", 0.6) ));
p1 <- p1 + scale_size( range=c(5, 30)) + theme_bw(); # + scale_fill_gradientn(colours = heat_hcl(7), limits = c(-300, 0) );
ex <- one.data [ one.data$dispensability < 0.15, ];
p1 <- p1 + geom_text( data = ex, aes(plot_X, plot_Y, label = description), colour = I(alpha("black", 0.85)), size = 3 );
p1 <- p1 + labs (y = "semantic space x", x = "semantic space y");
p1 <- p1 + theme(legend.key = element_blank()) ;
one.x_range = max(one.data$plot_X) - min(one.data$plot_X);
one.y_range = max(one.data$plot_Y) - min(one.data$plot_Y);
p1 <- p1 + xlim(min(one.data$plot_X)-one.x_range/10,max(one.data$plot_X)+one.x_range/10);
p1 <- p1 + ylim(min(one.data$plot_Y)-one.y_range/10,max(one.data$plot_Y)+one.y_range/10);


# --------------------------------------------------------------------------
# Output the plot to screen
pdf( file="H_T2_VS_T3_scatterplot.pdf", width=16, height=9 ) 
p1
dev.off()

