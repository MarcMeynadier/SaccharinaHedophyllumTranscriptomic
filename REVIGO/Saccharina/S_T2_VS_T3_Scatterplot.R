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
revigo.data <- rbind(c("GO:0006950","response to stress",4.90663876400189,6.220122288301623,2.200526859328018,6.168838538858752,-0.34561165880942746,0.5467213347080293,0.51550886),
c("GO:0006979","response to oxidative stress",0.5712981471310761,5.568572190133714,3.256033351998798,5.23491950292478,-0.5470120941061491,0.6320993157176307,0.32943569),
c("GO:0009987","cellular process",79.12519251933975,2.4106796813296762,-6.489034933997437,7.376368956838209,-0.3089777741005573,1,-0),
c("GO:0030001","metal ion transport",2.081427431784025,-2.0878601382430517,6.577015643056866,5.796416126855009,-0.7533266533060027,0.9164041429263501,-0),
c("GO:0042221","response to chemical",3.5497133630507625,6.517935906008729,1.3262649713977765,6.028247851305722,-0.5427465445308218,0.5612838659421844,0.40359782),
c("GO:0050896","response to stimulus",14.674014998147983,-4.905124754077996,-0.3035257675620955,6.644603215942828,-0.8939451599062136,1,-0),
c("GO:0051179","localization",18.792076186036212,-2.4461483190438185,-4.421923531767932,6.75202900021518,-1.2303051936903844,1,-0),
c("GO:0051716","cellular response to stimulus",12.016805727629972,5.516818532157661,1.7327307191472103,6.557843319194743,-0.8040533246194013,0.5024186880187855,0.63796693),
c("GO:0055085","transmembrane transport",13.53545668727302,-2.81571422633432,5.758084615409816,6.609527179077396,-1.3413590941775742,0.9069630320488661,0.46981001),
c("GO:1990748","cellular detoxification",0.8428541930100178,5.696229833605236,0.404190963829058,5.403808324413346,-1.3398557839211127,0.48429752495213996,0));

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
pdf( file="S_T2_VS_T3_scatterplot.pdf", width=16, height=9 ) 
p1
dev.off()

