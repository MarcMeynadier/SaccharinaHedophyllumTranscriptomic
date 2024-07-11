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
revigo.data <- rbind(c("GO:0006091","generation of precursor metabolites and energy",2.62835465282124,-2.4027265046533755,7.292456853891046,5.897738674144431,-1.0582550850508752,0.8831772949933698,0.0676671),
c("GO:0006412","translation",5.085673767131161,-6.659122469980924,-0.10113743840334997,6.184402940776566,-1.6197706630619626,0.5688625024927815,0.66980486),
c("GO:0006414","translational elongation",0.45853729473473576,-7.7700250097909995,0.27327868246195264,5.139431973597713,-1.0076586004423747,0.6772770557697786,0.07976143),
c("GO:0006457","protein folding",1.0590625918025878,4.3407047473104,-3.1566604807725853,5.502977151016975,-1.5086102880706946,0.9858346725004642,0.00846668),
c("GO:0006556","S-adenosylmethionine biosynthetic process",0.05360805457278003,-6.474028159016798,3.943917918237729,4.2073111514361345,-1.384776131868172,0.7797807955892112,0.53139023),
c("GO:0006790","sulfur compound metabolic process",1.9505422206753265,-0.40546750148506305,6.358239912317999,5.768210254776623,-0.620036738839665,0.8881161033055086,0.09500459),
c("GO:0006811","monoatomic ion transport",4.401907471506606,4.104169277097082,2.4285585493730606,6.1216953964406695,-1.0337456000650995,0.8987167761485992,0.41209348),
c("GO:0008152","metabolic process",65.3565173451011,4.947528518455484,-0.9836085501986325,7.293343082853126,-0.5852204574193722,1,-0),
c("GO:0009058","biosynthetic process",28.23839282673206,0.2155860985790568,-6.954216033497093,6.928894185470589,-0.47601694615777285,0.8847999987804124,0.14934071),
c("GO:0009059","macromolecule biosynthetic process",15.258385035486357,-6.49687144727376,-0.8908592442517471,6.661562823384344,-1.0540835642542068,0.6725108820558322,0.33214411),
c("GO:0009987","cellular process",79.12519251933975,3.1624067195584944,-5.349679496505851,7.376368956838209,-0.318455766987809,1,-0),
c("GO:0010467","gene expression",9.706370753664654,-7.845709034479184,-4.559824794481555,6.465111183714701,-0.9522774364067651,0.8535687900969018,0.29468075),
c("GO:0015980","energy derivation by oxidation of organic compounds",1.3592204656440126,1.5494819500198014,5.995341638513863,5.611345126683129,-0.8584436258757309,0.8480982231764427,0.09068117),
c("GO:0019538","protein metabolic process",18.67385374490695,-5.889653511234402,-3.454128784184295,6.7492881892860686,-2.3445734122540816,0.7467049539083533,0.23871088),
c("GO:0034220","monoatomic ion transmembrane transport",3.707494071415495,3.901733429474318,3.1647548112508166,6.047135013730295,-0.9319477878877299,0.8286056386172531,0.50368514),
c("GO:0043170","macromolecule metabolic process",38.34861513800723,-4.089786661058174,-6.039766763243762,7.061803881678349,-0.33539750755512526,0.8453334481581443,0.17675389),
c("GO:0043603","amide metabolic process",6.518961624921768,0.2903965291770005,-2.26410178448537,6.292232804957447,-1.975268110344751,0.8710395620043397,0.09036333),
c("GO:0044237","cellular metabolic process",49.22533251163365,-1.9839851194753004,-6.570401233938482,7.170242846650484,-0.6482983672542854,0.8580471119218379,0.06778182),
c("GO:0044249","cellular biosynthetic process",24.389190152163454,-5.084748728567856,1.6133275350253593,6.865251597822689,-0.6605127830473448,0.6553602013411214,0.66782618),
c("GO:0044271","cellular nitrogen compound biosynthetic process",18.93399433857433,-4.818252012983282,0.6850303860791387,6.755296478091295,-0.6797809912370048,0.6299442747876409,0.61091007),
c("GO:0044272","sulfur compound biosynthetic process",1.2460139050319528,-6.463740819293159,3.1246279607600487,5.573578207111253,-0.8746065780218151,0.7155343750307948,0.67825539),
c("GO:0046500","S-adenosylmethionine metabolic process",0.09139679366822917,-6.018670591987567,6.399735066281114,4.439000924079503,-1.5461620409169552,0.8474071914102682,0),
c("GO:0098660","inorganic ion transmembrane transport",2.8120629398541377,3.676247226807182,2.824795143243459,5.9270797094445795,-1.1316612620409356,0.8730161707214703,0.01203986),
c("GO:1901564","organonitrogen compound metabolic process",29.993834591427927,-3.152462636551911,-3.8850047414472213,6.955086199151694,-0.7409319882376819,0.806558359390033,0.25443166),
c("GO:1901566","organonitrogen compound biosynthetic process",14.63667861962968,-5.181703081653427,-0.5457367747544524,6.643496794616454,-0.9626571815344467,0.6535163573217708,0.50121883),
c("GO:1901576","organic substance biosynthetic process",27.07678740968754,-5.6706479929254865,-0.06629471796430582,6.910651347384342,-0.9471329902458194,0.6590029331374224,0.56953202));

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
pdf( file="H_C_VS_T3_scatterplot.pdf", width=16, height=9 ) 
p1
dev.off()

