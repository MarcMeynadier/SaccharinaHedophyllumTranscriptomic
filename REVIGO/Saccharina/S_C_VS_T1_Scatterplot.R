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
revigo.data <- rbind(c("GO:0006412","translation",5.085673767131161,4.187139271623411,-4.429065139549825,6.184402940776566,-0.3893132265438911,0.4761681301245678,0.46208387),
c("GO:0006457","protein folding",1.0590625918025878,3.172513730671663,5.763881105594827,5.502977151016975,-2.343997679317043,0.9944492079366227,0),
c("GO:0006508","proteolysis",5.350747086797883,4.962220964514914,-2.353097903851665,6.206468852551757,-0.45426993082865563,0.6280269664285861,0.36604549),
c("GO:0006807","nitrogen compound metabolic process",48.837649518475466,-5.317003849381545,-3.1959072027133986,7.1668089422978785,-0.39032130100885293,0.8300759508392611,0.17591958),
c("GO:0009056","catabolic process",6.059177012419161,-3.9583182668013848,3.7295210527983533,6.260468037413432,-0.6393725106108807,0.8960223277273017,0.06991995),
c("GO:0009057","macromolecule catabolic process",2.3186905544982737,7.8798876163350275,-0.6739605922855735,5.843297574736139,-0.7046132521512654,0.5448668395028482,-0),
c("GO:0009059","macromolecule biosynthetic process",15.258385035486357,3.3251051421043134,-5.726927613242748,6.661562823384344,-0.35493848242007736,0.6065818957493818,0.55144154),
c("GO:0019538","protein metabolic process",18.67385374490695,3.0909191675059224,-2.214618368218645,6.7492881892860686,-0.9155738745070098,0.5982016079335011,0.21715385),
c("GO:0030163","protein catabolic process",1.1278347042519765,6.706812984013423,-1.9891188046799475,5.5303008936809706,-0.6245668518300569,0.45800703804662996,0.65636613),
c("GO:0043170","macromolecule metabolic process",38.34861513800723,-3.7512567483595403,-5.272507095416528,7.061803881678349,-0.47269110594250585,0.7963535347488366,0.12436747),
c("GO:0043603","amide metabolic process",6.518961624921768,0.00887245701698903,1.993524208822707,6.292232804957447,-0.5068976165704281,0.809948626804208,0.07115478),
c("GO:0044249","cellular biosynthetic process",24.389190152163454,1.2907371725742718,-8.002459418746309,6.865251597822689,-0.6629402736794755,0.6811366080635122,0.05694207),
c("GO:0044271","cellular nitrogen compound biosynthetic process",18.93399433857433,1.4545824196871588,-5.859875328787617,6.755296478091295,-0.35295559851313124,0.6194016774682066,0.59014338),
c("GO:1901564","organonitrogen compound metabolic process",29.993834591427927,-0.917519640673261,-2.3667438695061365,6.955086199151694,-0.662177481036395,0.7251073280511637,0.25443166),
c("GO:1901566","organonitrogen compound biosynthetic process",14.63667861962968,2.2343378076679885,-4.657939898204485,6.643496794616454,-0.3047574264011313,0.5442675774075506,0.54455842));

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
pdf( file="S_C_VS_T1_scatterplot.pdf", width=16, height=9 ) 
p1
dev.off()


