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
revigo.data <- rbind(c("GO:0000097","sulfur amino acid biosynthetic process",0.4753877262335075,-6.484535601300957,-3.2512149885669896,5.15510516225765,-1.6721100183514574,0.4617980577579239,0),
c("GO:0006082","organic acid metabolic process",8.895121929802153,-5.316594261360307,-5.335578383686326,6.427206226819538,-0.5437129366833218,0.5903482241840751,0.61251244),
c("GO:0006091","generation of precursor metabolites and energy",2.62835465282124,-2.285030708746845,-8.636950971642012,5.897738674144431,-0.8018076918319963,0.8657775739358771,0.09500459),
c("GO:0006412","translation",5.085673767131161,-6.45794403180272,-0.6872870559405528,6.184402940776566,-0.9222688203476079,0.5527906699190307,0.39396409),
c("GO:0006790","sulfur compound metabolic process",1.9505422206753265,2.638525805213888,-0.9764541024082434,5.768210254776623,-1.059687761181327,0.8711754750068305,0.07750958),
c("GO:0006811","monoatomic ion transport",4.401907471506606,2.9552069834417036,-5.737909096920739,6.1216953964406695,-0.5159081022115846,0.9247796222039689,0.41209348),
c("GO:0008152","metabolic process",65.3565173451011,5.434622832894199,0.9635218339561311,7.293343082853126,-0.5324925262609468,1,-0),
c("GO:0009058","biosynthetic process",28.23839282673206,0.3200188520917136,5.901451847067226,6.928894185470589,-0.6272959929161674,0.8829090736994322,0.14934071),
c("GO:0009059","macromolecule biosynthetic process",15.258385035486357,-6.373550748818352,0.41699883060622506,6.661562823384344,-0.46945326112775015,0.6587376695759913,0.56953202),
c("GO:0009066","aspartate family amino acid metabolic process",0.8335242561063357,-6.376758527827575,-4.849927370251764,5.398974134528076,-0.5509074688805811,0.5516980754176546,0.66063227),
c("GO:0009067","aspartate family amino acid biosynthetic process",0.7067468781798288,-6.5241541398258285,-2.865384712560393,5.327320101614222,-0.583575861810416,0.4657676528540915,0.64913149),
c("GO:0009987","cellular process",79.12519251933975,5.533688847712614,-1.93702791406994,7.376368956838209,-0.3982191325548129,1,-0),
c("GO:0010467","gene expression",9.706370753664654,-7.122409597016503,4.311003459495307,6.465111183714701,-0.6774168775687096,0.8653112086705553,0.0968997),
c("GO:0015980","energy derivation by oxidation of organic compounds",1.3592204656440126,3.282308074436649,2.088990736053872,5.611345126683129,-0.4238752750649395,0.8771507599136,0.08739706),
c("GO:0016053","organic acid biosynthetic process",4.173911088262467,-5.9763628666311694,-3.0724989076745555,6.0985976985445784,-0.8667453920830168,0.4551818216758115,0.61893742),
c("GO:0034220","monoatomic ion transmembrane transport",3.707494071415495,2.183651579068683,-6.657935281448199,6.047135013730295,-0.4648869792587226,0.9046640091790817,0.50368514),
c("GO:0043603","amide metabolic process",6.518961624921768,-3.409743925944346,6.123655887120361,6.292232804957447,-0.6635983093847462,0.8587586683318054,0.09076698),
c("GO:0044237","cellular metabolic process",49.22533251163365,-0.3098550837691735,4.183501571364816,7.170242846650484,-1.0396862247504393,0.8606844236613954,0.04864775),
c("GO:0044249","cellular biosynthetic process",24.389190152163454,-4.456791350194297,-1.3325727202550601,6.865251597822689,-0.47940381422279016,0.6207709354827494,0.66782618),
c("GO:0044281","small molecule metabolic process",15.15473791824727,3.216370096764196,4.5371331649479405,6.658602684396198,-0.36184832601960887,0.8985215571006988,0.11353227),
c("GO:0044283","small molecule biosynthetic process",6.034460163531009,-5.625426681199726,-2.8090247551320897,6.258692822898982,-0.7003968315145346,0.5520556830400412,0.392549),
c("GO:0055085","transmembrane transport",13.53545668727302,2.7139564310311948,-6.123499097176011,6.609527179077396,-0.31329403474692985,0.8952594243068406,0.5384965),
c("GO:0098660","inorganic ion transmembrane transport",2.8120629398541377,2.260771955788425,-6.27627601256705,5.9270797094445795,-0.5642718647332616,0.9076321835796111,0.0109587),
c("GO:1901564","organonitrogen compound metabolic process",29.993834591427927,-3.7133846772199774,3.85197286382487,6.955086199151694,-0.5273386086990232,0.799393513899416,0.18637799),
c("GO:1901566","organonitrogen compound biosynthetic process",14.63667861962968,-5.585572300077834,-0.3360075040345086,6.643496794616454,-1.1685589752888854,0.6038423381663047,0.26208529),
c("GO:1901576","organic substance biosynthetic process",27.07678740968754,-5.212767513378242,0.0015604027641711938,6.910651347384342,-1.0371525879478156,0.6362847961511804,0.56219288));

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
pdf( file="H_T1_VS_T3_scatterplot.pdf", width=16, height=9 ) 
p1
dev.off()

