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
revigo.data <- rbind(c("GO:0000097","sulfur amino acid biosynthetic process",0.4753877262335075,5.418827096324715,4.798182538749422,5.15510516225765,-1.8469605478766684,0.4716543967091712,0),
c("GO:0006082","organic acid metabolic process",8.895121929802153,4.426148468701632,4.2564920909262876,6.427206226819538,-0.983478092916409,0.5746689173055536,0.44426927),
c("GO:0006091","generation of precursor metabolites and energy",2.62835465282124,3.3129572031790544,-6.277607288082226,5.897738674144431,-0.6434613277184335,0.8659187809082162,0.09500459),
c("GO:0006457","protein folding",1.0590625918025878,-5.837006163814527,1.6343222685336571,5.502977151016975,-1.1915913768876876,0.9820572497881609,0.00987736),
c("GO:0006468","protein phosphorylation",4.340892012483024,5.235447334834082,-0.4609918360284419,6.115633473764006,-0.44240835347185065,0.6967241439879504,0.19868265),
c("GO:0006520","amino acid metabolic process",5.465247531707815,5.539310376273006,2.989858485913401,6.215664259962457,-0.575346509521286,0.4808322096000492,0.6913116),
c("GO:0006790","sulfur compound metabolic process",1.9505422206753265,-0.29808816242139685,-5.8080561310445695,5.768210254776623,-0.8930615492618217,0.871050426063766,0.07750958),
c("GO:0006793","phosphorus metabolic process",13.171532602957267,2.847956190149845,-3.8443651771266603,6.597690579747489,-0.34337904193841406,0.8295534804931021,0.12703009),
c("GO:0006811","monoatomic ion transport",4.401907471506606,-3.2000015255697867,5.60481408485287,6.1216953964406695,-1.033746116389744,0.8739253945957133,0.41209348),
c("GO:0008652","amino acid biosynthetic process",2.8043395482354745,5.613246803214193,3.604469888000997,5.925885270652105,-1.0982860813470818,0.4475597198364303,0.68373962),
c("GO:0009056","catabolic process",6.059177012419161,-4.657318101965083,-0.3961952016654281,6.260468037413432,-0.4343189682681796,0.9244295985034326,0.06282687),
c("GO:0009066","aspartate family amino acid metabolic process",0.8335242561063357,5.750709545169398,4.283619511800391,5.398974134528076,-0.5509074688805811,0.5286643724891412,0.4420088),
c("GO:0015980","energy derivation by oxidation of organic compounds",1.3592204656440126,-2.6570872750612566,-4.446265497273172,5.611345126683129,-0.4238757360849838,0.8767657774880867,0.08739706),
c("GO:0016310","phosphorylation",7.474579996508841,5.515176775682932,-3.6664501723504888,6.35164114641232,-0.31460816607854425,0.8167690033461033,0.62371761),
c("GO:0019538","protein metabolic process",18.67385374490695,6.1215215932178,1.0420913050832747,6.7492881892860686,-0.509800968387672,0.7218634415647793,0.35014548),
c("GO:0034220","monoatomic ion transmembrane transport",3.707494071415495,-2.268926720951559,6.6407728042139595,6.047135013730295,-0.9319466739708198,0.8060715357365827,0.50368514),
c("GO:0043412","macromolecule modification",10.822311035682203,0.7311179302384929,-1.0203999084108932,6.512374303850409,-0.4460737886776865,0.864197410890678,0.22045786),
c("GO:0044281","small molecule metabolic process",15.15473791824727,-4.8166452502532975,-2.8146814122455703,6.658602684396198,-0.5402680507861014,0.9112884693495192,0.04072701),
c("GO:0044283","small molecule biosynthetic process",6.034460163531009,4.754501674197144,6.095719371472678,6.258692822898982,-0.7003966136527615,0.6181764291407451,0.61251244),
c("GO:0055085","transmembrane transport",13.53545668727302,-2.850249583620405,5.958615110408663,6.609527179077396,-0.38532905551264585,0.8360320944950312,0.5384965),
c("GO:0098660","inorganic ion transmembrane transport",2.8120629398541377,-2.6600560251958845,6.441621352476424,5.9270797094445795,-1.131658909677672,0.8487327239347392,0.01203986),
c("GO:1901564","organonitrogen compound metabolic process",29.993834591427927,8.097080531937392,-0.3159540427074946,6.955086199151694,-0.4533176938173294,0.8250047026530892,0.11190784));

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
pdf( file="H_C_VS_T1_scatterplot.pdf", width=16, height=9 ) 
p1
dev.off()

