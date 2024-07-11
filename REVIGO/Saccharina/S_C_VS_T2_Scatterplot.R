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
revigo.data <- rbind(c("GO:0006091","generation of precursor metabolites and energy",2.62835465282124,-0.6891422809711278,6.1051382511025665,5.897738674144431,-3.1023729087095586,0.870468812949134,0),
c("GO:0006414","translational elongation",0.45853729473473576,7.218709502714479,-2.5776040039687684,5.139431973597713,-0.3570174054980883,0.7122212917577037,0.3525854),
c("GO:0006457","protein folding",1.0590625918025878,-4.870663170439093,-3.3998056966708696,5.502977151016975,-0.6950121280150687,0.9851422820541959,0.0119405),
c("GO:0006508","proteolysis",5.350747086797883,5.7250285080502135,-3.5175095242631165,6.206468852551757,-0.5190765417649881,0.7562791692120633,0.40040007),
c("GO:0006811","monoatomic ion transport",4.401907471506606,-0.6943780234330762,-7.300436126873248,6.1216953964406695,-0.8035695603593604,0.9240330968543871,-0),
c("GO:0018193","peptidyl-amino acid modification",2.047197706052904,5.9037797119891895,-4.484327483600317,5.789214650731967,-0.7895396819600116,0.7855462423501256,0.03914793),
c("GO:0019538","protein metabolic process",18.67385374490695,4.786895565710148,-2.278560515622219,6.7492881892860686,-0.8909481899484226,0.7248612548005271,0.31635035),
c("GO:0019637","organophosphate metabolic process",5.94718450776783,3.085203222249107,6.071930874350881,6.252365814198532,-0.3687125239435864,0.682929283712379,0.53380606),
c("GO:0019693","ribose phosphate metabolic process",2.299871024016621,3.2660747553326965,6.782461690119936,5.839758268584501,-0.7154339227330264,0.6089316660376797,0.0971165),
c("GO:0022900","electron transport chain",1.6021713573797571,-3.229681636405492,4.665143331804241,5.682764023912308,-0.6071659227644848,0.8788257743033707,0.09259975),
c("GO:0034220","monoatomic ion transmembrane transport",3.707494071415495,-1.6570480900361733,-6.679255219800231,6.047135013730295,-0.5939693499180914,0.9099313754445715,0.42984343),
c("GO:0043170","macromolecule metabolic process",38.34861513800723,-1.08492525816937,0.380040014799737,7.061803881678349,-0.3471022224675553,0.8361807523858785,0.20088823),
c("GO:0044271","cellular nitrogen compound biosynthetic process",18.93399433857433,5.056325472540084,1.1967906510338522,6.755296478091295,-0.5886884494233614,0.6235602185795502,0.38211295),
c("GO:0051179","localization",18.792076186036212,-5.582401189044225,-0.6613920487194932,6.75202900021518,-0.6294369518305356,1,-0),
c("GO:0055085","transmembrane transport",13.53545668727302,-1.1802158706558894,-7.007081462523881,6.609527179077396,-1.1221681085071062,0.8979563723930988,0.5384965),
c("GO:0055086","nucleobase-containing small molecule metabolic process",4.5204226165387285,6.633519094505073,2.19771681350917,6.133233517547702,-0.7882869149683953,0.7224826137020548,0.10686008),
c("GO:0072521","purine-containing compound metabolic process",2.595262480894418,6.630194583756564,-0.0780485876805553,5.892236003769251,-0.46663218365653686,0.7240523228603282,0.29056141),
c("GO:0072522","purine-containing compound biosynthetic process",1.9841965171428693,6.937430027241018,-1.1031010114669266,5.775639569878691,-0.5761367197757676,0.6650081150220146,0.27944364),
c("GO:1901135","carbohydrate derivative metabolic process",6.41604626743983,-4.704923798750288,2.079734479059244,6.285321871094186,-0.3850342720378737,0.8852735216887214,0.06547741),
c("GO:1901564","organonitrogen compound metabolic process",29.993834591427927,2.3814553944543544,-0.2196468066120958,6.955086199151694,-1.1929861673383626,0.7835566122162662,0.17051218),
c("GO:1901566","organonitrogen compound biosynthetic process",14.63667861962968,5.155244606609999,-1.6250930064059734,6.643496794616454,-0.3059329576249306,0.6414524883306021,0.50610956));

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
# Output the plot to screen
pdf( file="S_C_VS_T2_scatterplot.pdf", width=16, height=9 ) 
p1
dev.off()

