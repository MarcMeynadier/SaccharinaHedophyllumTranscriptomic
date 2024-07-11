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
revigo.data <- rbind(c("GO:0006139","nucleobase-containing compound metabolic process",23.636924490908086,1.161722533226154,5.6144747592860185,6.851645187818115,-0.6512844068599692,0.4950444012692839,0.57248272),
c("GO:0006725","cellular aromatic compound metabolic process",26.410310601416047,-2.2457359453349914,6.883409171169762,6.8998277223761,-0.5254879917452241,0.7128943552219421,0.21430308),
c("GO:0006793","phosphorus metabolic process",13.171532602957267,-3.9744396223499128,6.396144004407029,6.597690579747489,-0.6832289414856519,0.7522643527823785,0.12102482),
c("GO:0018130","heterocycle biosynthetic process",13.771272921376537,2.2044982266196365,4.681223718756794,6.617028349064776,-0.7329996756717927,0.4736928327821922,0.53496242),
c("GO:0019438","aromatic compound biosynthetic process",13.451580388199883,2.4893438467368343,5.074399572340887,6.60682757763083,-0.7420168060250156,0.47582829942245763,0.38403062),
c("GO:0019637","organophosphate metabolic process",5.94718450776783,-3.7648290570399996,2.269489465072489,6.252365814198532,-1.2214074411868805,0.5999664697097458,0.59904924),
c("GO:0034654","nucleobase-containing compound biosynthetic process",11.392930641947556,2.860261470739923,4.321370519366333,6.534689739150223,-0.7683902549774131,0.4440433588210534,0.56998917),
c("GO:0044281","small molecule metabolic process",15.15473791824727,-4.869098393823755,-2.3244307952076984,6.658602684396198,-0.929651769964428,0.8674933088275472,0.0507484),
c("GO:0046483","heterocycle metabolic process",26.396317359150885,-2.7230400649778135,5.1008071945699225,6.899597554781196,-0.5219662385369346,0.7129282006004896,0.27023854),
c("GO:0055086","nucleobase-containing small molecule metabolic process",4.5204226165387285,1.9538803636988349,7.550047262527407,6.133233517547702,-0.7882869149683953,0.5871115835921293,0.29056141),
c("GO:0072521","purine-containing compound metabolic process",2.595262480894418,3.589554650694872,7.446800705369581,5.892236003769251,-1.344093581819785,0.6353875759043673,0.25896296),
c("GO:0072522","purine-containing compound biosynthetic process",1.9841965171428693,4.344109660050729,5.164473860855369,5.775639569878691,-1.223851113208352,0.5683557738020912,0),
c("GO:0090407","organophosphate biosynthetic process",4.716540883816774,1.80715046441467,2.016098651605746,6.1516780684784855,-1.043255454717309,0.425465718753824,0.31086666),
c("GO:1901135","carbohydrate derivative metabolic process",6.41604626743983,-0.4156082729331221,-4.652942167661031,6.285321871094186,-1.242452146530756,0.8545312059516127,0.06517039),
c("GO:1901137","carbohydrate derivative biosynthetic process",4.616841943085589,6.295374561461289,1.7118512627158988,6.1423994785563165,-1.0907703490738683,0.5806636563921108,0.27238895),
c("GO:1901360","organic cyclic compound metabolic process",27.27731619259278,3.9643398940439964,-3.488202198603774,6.9138558498071845,-0.6128665542621458,0.8038332959296762,0.10739063),
c("GO:1901362","organic cyclic compound biosynthetic process",14.3966447883804,4.87636967486645,3.9714818827278258,6.636315548552797,-0.7286696289338411,0.5101629859767741,0.46012145),
c("GO:1901566","organonitrogen compound biosynthetic process",14.63667861962968,5.246266667400656,3.0592553708221417,6.643496794616454,-0.3030122898521444,0.5668535485934129,0.4936698));

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
pdf( file="S_T1_VS_T2_scatterplot.pdf", width=16, height=9 ) 
p1
dev.off()

