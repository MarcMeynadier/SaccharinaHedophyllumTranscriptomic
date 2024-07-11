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
revigo.data <- rbind(c("GO:0005975","carbohydrate metabolic process",5.521546466478484,2.6339735879807606,5.527602533673562,6.220115151808519,-0.35661543412546903,0.8878835339656664,0.08327525),
c("GO:0006414","translational elongation",0.45853729473473576,-7.307378523413275,0.9990531643697101,5.139431973597713,-0.7185643577394225,0.687790967826683,0.29431777),
c("GO:0006418","tRNA aminoacylation for protein translation",0.974318159563009,-6.747842510765647,-0.48371972718251893,5.466756438594257,-0.45390419873317484,0.6018442493055934,0.56454341),
c("GO:0006520","amino acid metabolic process",5.465247531707815,-6.236008175000885,-2.837630500838149,6.215664259962457,-0.43040139234890545,0.6978466123454923,0.59635002),
c("GO:0006807","nitrogen compound metabolic process",48.837649518475466,-2.472566652016446,6.726359881226035,7.1668089422978785,-0.31484159258232436,0.8645984399877705,0.22128816),
c("GO:0006811","monoatomic ion transport",4.401907471506606,1.2839702830002946,-6.525837705840832,6.1216953964406695,-1.0337456000650995,0.9368244037504695,0),
c("GO:0006979","response to oxidative stress",0.5712981471310761,4.436650251753952,2.9911455182895805,5.23491950292478,-0.638272163982407,0.9156218618785936,0.32943569),
c("GO:0008152","metabolic process",65.3565173451011,5.6611252545257225,-1.3794817340236447,7.293343082853126,-0.3842897703389928,1,-0),
c("GO:0009058","biosynthetic process",28.23839282673206,-0.9176633642130353,7.483146774654496,6.928894185470589,-0.43322675179875214,0.8853842844570147,0.09351135),
c("GO:0009059","macromolecule biosynthetic process",15.258385035486357,-6.072599936421077,3.5812466185263667,6.661562823384344,-1.0576644883373616,0.7194513485839499,0.20486237),
c("GO:0009141","nucleoside triphosphate metabolic process",0.762872851553353,-5.082906619808238,-4.821915837229224,5.3605082123064145,-0.3640821757057693,0.7288885235673651,0.61386709),
c("GO:0010467","gene expression",9.706370753664654,-7.710108993605745,4.593328210385309,6.465111183714701,-0.7854819950201596,0.8442797829045714,0.28055017),
c("GO:0018193","peptidyl-amino acid modification",2.047197706052904,-8.27360892027162,0.3722968367490443,5.789214650731967,-0.9181883966201059,0.784800107721582,0.05670879),
c("GO:0019538","protein metabolic process",18.67385374490695,-6.120453469412725,0.7815888638230262,6.7492881892860686,-0.6949002502343435,0.7114314056584692,0.33214411),
c("GO:0019637","organophosphate metabolic process",5.94718450776783,-3.3803513493525026,-6.333161489682027,6.252365814198532,-0.38993740274345995,0.8001447854412209,0.53380606),
c("GO:0019693","ribose phosphate metabolic process",2.299871024016621,-3.2535913158450693,-6.9670331390141715,5.839758268584501,-0.9653915943676379,0.8057398363178058,-0),
c("GO:0034220","monoatomic ion transmembrane transport",3.707494071415495,2.0774565243801546,-5.9860892971123,6.047135013730295,-0.9319477878877299,0.9198124965089509,0.42984343),
c("GO:0034641","cellular nitrogen compound metabolic process",30.187049102942364,-2.399251173532155,-0.26965271338728924,6.957874867913695,-0.7323965393165471,0.776094726105518,0.30530756),
c("GO:0034660","ncRNA metabolic process",3.769763500568378,-5.314069806261075,-0.9771487808438645,6.054368647279385,-0.5033705891308075,0.7496608764219089,0.34556187),
c("GO:0042221","response to chemical",3.5497133630507625,4.4286916842819775,2.3960986809328273,6.028247851305722,-0.6309363579262222,0.8983771117957404,0.40359782),
c("GO:0043038","amino acid activation",0.9991846865833046,-7.231424973294976,-3.3696013770518283,5.47770137405037,-0.35427520549941094,0.7524355136661137,0.59496536),
c("GO:0043603","amide metabolic process",6.518961624921768,0.190683237488355,-0.8963823683808475,6.292232804957447,-1.2347338941229895,0.8534156966287576,0.12584976),
c("GO:0044238","primary metabolic process",54.063119334849006,-1.5192126507217816,5.936353269231173,7.210955285610252,-0.4088908522338173,0.8601056397000303,0.15678936),
c("GO:0044249","cellular biosynthetic process",24.389190152163454,-4.498269960882925,2.6690042736636967,6.865251597822689,-0.9160568592636398,0.7006826835140462,0.55144154),
c("GO:0044271","cellular nitrogen compound biosynthetic process",18.93399433857433,-4.488303233915922,0.40797783272153587,6.755296478091295,-0.43376290698312164,0.648267899636923,0.59014338),
c("GO:0044281","small molecule metabolic process",15.15473791824727,1.4896226668643997,6.892710551152044,6.658602684396198,-0.4680602090314609,0.9024889348713317,0.05207235),
c("GO:0050896","response to stimulus",14.674014998147983,4.76076392249081,-3.6806503970118993,6.644603215942828,-0.3251544684352775,1,-0),
c("GO:0051716","cellular response to stimulus",12.016805727629972,4.704682515405049,2.499409286639625,6.557843319194743,-0.359158953139323,0.8685743626870004,0.60012237),
c("GO:0055085","transmembrane transport",13.53545668727302,1.5966052285780905,-6.347128790353445,6.609527179077396,-0.4521699348214782,0.911708323937874,0.5384965),
c("GO:0055086","nucleobase-containing small molecule metabolic process",4.5204226165387285,-5.441990295101809,-3.1314818915590954,6.133233517547702,-0.6692575860454979,0.7215074787014796,0.10498231),
c("GO:0072521","purine-containing compound metabolic process",2.595262480894418,-6.516533733550742,-2.024930279510573,5.892236003769251,-0.6046980749146497,0.755397845082129,0.29056141),
c("GO:0098660","inorganic ion transmembrane transport",2.8120629398541377,1.7848746947510234,-6.027268733206487,5.9270797094445795,-0.32642067823700904,0.9223415437820497,0.50368514),
c("GO:1901135","carbohydrate derivative metabolic process",6.41604626743983,3.864930726492243,-1.8870245654341429,6.285321871094186,-0.40277445690260333,0.8948265521896288,0.06664641),
c("GO:1901564","organonitrogen compound metabolic process",29.993834591427927,-2.2813695718497145,1.5886834167397994,6.955086199151694,-0.8434387346256829,0.7854116788240867,0.18637799),
c("GO:1901566","organonitrogen compound biosynthetic process",14.63667861962968,-5.388048000244803,1.4231324482752437,6.643496794616454,-0.7303703256424472,0.6679438368579599,0.50121883),
c("GO:1901576","organic substance biosynthetic process",27.07678740968754,-4.633750562459937,4.3625415159906,6.910651347384342,-0.4183904958811687,0.715828007528798,0.66782618),
c("GO:1990748","cellular detoxification",0.8428541930100178,4.785900325254972,1.9737949596051219,5.403808324413346,-0.9220764080650671,0.8584388093376147,0.01143507));

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
pdf( file="H_T1_VS_T2_scatterplot.pdf", width=16, height=9 ) 
p1
dev.off()

