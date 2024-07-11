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
revigo.data <- rbind(c("GO:0001172","RNA-templated transcription",0.03587618518471213,7.163109130723554,-4.484609591125595,4.032900678732676,-1.3102379881444948,0.8414929721713792,0.23925645),
c("GO:0006091","generation of precursor metabolites and energy",2.62835465282124,-2.743984219070875,-0.36689539575844093,5.897738674144431,-0.8489287723857524,0.9012079805535839,0.07976143),
c("GO:0006412","translation",5.085673767131161,4.9155053738767265,-3.7004084392124947,6.184402940776566,-3.495463352651212,0.6220490638178979,0.66980486),
c("GO:0006414","translational elongation",0.45853729473473576,5.245648844425107,-4.733485986249726,5.139431973597713,-2.045103356886606,0.7191171663051614,0),
c("GO:0006457","protein folding",1.0590625918025878,-6.359739416856673,-1.012490695890438,5.502977151016975,-1.4999359594869985,0.9878690355532181,0.00984147),
c("GO:0006807","nitrogen compound metabolic process",48.837649518475466,5.673721265788011,4.17412277005553,7.1668089422978785,-1.1213996824235897,0.8738526823898862,0.17591958),
c("GO:0006811","monoatomic ion transport",4.401907471506606,-1.8722366356626563,5.71553498282658,6.1216953964406695,-1.6840437116451128,0.937977826929735,-0),
c("GO:0006979","response to oxidative stress",0.5712981471310761,-2.144787756098779,-7.119158567619873,5.23491950292478,-0.5470124001802301,0.9196496063713421,-0),
c("GO:0007264","small GTPase mediated signal transduction",0.33345626897253483,-3.5569856220050924,-5.67342365813307,5.001097377441363,-0.3832167554704519,0.8747377649598825,0.3013286),
c("GO:0007265","Ras protein signal transduction",0.07726717799377551,-3.8040456831297615,-5.4055583274431065,4.366067904812481,-0.3802112069680489,0.8704903731821495,0.48915419),
c("GO:0008152","metabolic process",65.3565173451011,-5.295660158260888,3.3190987059507453,7.293343082853126,-0.9026114844572575,1,-0),
c("GO:0009058","biosynthetic process",28.23839282673206,3.3031079375000045,6.030180434528576,6.928894185470589,-1.853875376648954,0.8945151263105755,0.13256613),
c("GO:0009059","macromolecule biosynthetic process",15.258385035486357,5.809400433806216,-3.1078184264792506,6.661562823384344,-3.5942417421802175,0.7205346774848062,0.51204972),
c("GO:0009987","cellular process",79.12519251933975,-6.06889414401268,1.0393894271430857,7.376368956838209,-0.4085211177893732,1,-0),
c("GO:0010467","gene expression",9.706370753664654,3.6175408428518994,-7.192143329246835,6.465111183714701,-1.888992019834076,0.8578116475826768,0.29468075),
c("GO:0015980","energy derivation by oxidation of organic compounds",1.3592204656440126,-3.1085729532908295,2.5722835722573083,5.611345126683129,-0.7835743907188177,0.8729688795742506,0.09068117),
c("GO:0019538","protein metabolic process",18.67385374490695,3.427614154021748,-3.109827658265599,6.7492881892860686,-6.919122171159858,0.7560633348640016,0.23871088),
c("GO:0019941","modification-dependent protein catabolic process",0.8274007574112628,3.133178190914635,-6.132086801377858,5.395771818867355,-0.337459275405227,0.8113194015395182,0.26812463),
c("GO:0023052","signaling",8.271383217529026,-5.273367329939904,-3.6203452034151287,6.395632475900429,-0.5601881095296173,0.9608933246429875,-0),
c("GO:0034220","monoatomic ion transmembrane transport",3.707494071415495,-1.067233423628897,6.044728944126672,6.047135013730295,-1.354695851230305,0.900765558925808,0.42984343),
c("GO:0034641","cellular nitrogen compound metabolic process",30.187049102942364,2.833252622388866,1.0433172930764396,6.957874867913695,-0.987146331446147,0.8006787275562326,0.30530756),
c("GO:0042221","response to chemical",3.5497133630507625,-2.556011521917436,-6.741335015132239,6.028247851305722,-0.30777554552473085,0.9077741402212164,0.38514006),
c("GO:0043170","macromolecule metabolic process",38.34861513800723,6.52527455906617,2.522557806821364,7.061803881678349,-4.291198430431209,0.8585746782164007,0.06848872),
c("GO:0043603","amide metabolic process",6.518961624921768,0.39429706506755247,0.9613908957207106,6.292232804957447,-4.796877868652899,0.8776317657817388,0.09036333),
c("GO:0044237","cellular metabolic process",49.22533251163365,4.655716361206471,4.385709154517542,7.170242846650484,-0.8667310128729786,0.8664507215532002,0.20673508),
c("GO:0044249","cellular biosynthetic process",24.389190152163454,6.171994336090761,-1.1913812127371444,6.865251597822689,-3.5254051320867434,0.7133396402112125,0.59014338),
c("GO:0044271","cellular nitrogen compound biosynthetic process",18.93399433857433,5.02354345332264,-1.4292068072657553,6.755296478091295,-3.925616607396592,0.6917985421284201,0.30270307),
c("GO:0070887","cellular response to chemical stimulus",1.7854239576547926,-2.8709312719781597,-6.48845252993401,5.729796325992063,-0.3190836096882208,0.8950064796612932,0.44473782),
c("GO:0098660","inorganic ion transmembrane transport",2.8120629398541377,-1.409540769827249,5.903765505542076,5.9270797094445795,-0.7721068709592599,0.9188307715472575,0.50368514),
c("GO:1901564","organonitrogen compound metabolic process",29.993834591427927,4.18729313425565,1.1976156875276418,6.955086199151694,-4.773067735423382,0.8156770820785909,0.25443166),
c("GO:1901566","organonitrogen compound biosynthetic process",14.63667861962968,5.148748159037676,-2.0867496183201784,6.643496794616454,-2.5580738779913026,0.6999918234967198,0.50610956),
c("GO:1901576","organic substance biosynthetic process",27.07678740968754,6.573540742472432,-1.3677406415029794,6.910651347384342,-2.618916883095608,0.7178515574404378,0.66782618));

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
pdf( file="S_C_VS_T3_scatterplot.pdf", width=16, height=9 ) 
p1
dev.off()

