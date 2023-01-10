#Load the revised measurements.csv
measurements <- read.csv(file = "data/measurements.csv")
#Getting rid of the extra indexing column, when the file is recalled
if (names(measurements)[1] == "X") {measurements <- measurements[,-1]}

#Use dplyr to sort the data by species, then by observer, then by limb volume
require("tidyverse")
measurements <- data.frame(measurements %>% arrange(Species, Observer, Limb.Volume))
measurements$Species <- as.factor(measurements$Species)
write.csv(measurements, file = "data/measurements.csv")

#Create a table showing the average volume for each species
measurements.summary <- data.frame(measurements %>% group_by(Species) %>% summarise(Mean.Volume=mean(Limb.Volume), StdDev.Volume=sd(Limb.Volume), Count=n()))

#Create a table showing the number of observations (i.e. rows) for each 
#combination of species and observer.
observer.summary <- data.frame(measurements %>% group_by(Observer) %>% summarise(Count=n()))

#Create a single box plot (or similar) to compare key features of the 
#distributions of volumes for each species. 
#See <http://www.sthda.com/english/wiki/ggplot2-box-plot-quick-start-guide-r-software-and-data-visualization>
b1 <- boxplot(Limb.Volume~Species, data=measurements)
#or
b2 <- ggplot(measurements, aes(x=Species, y=Limb.Volume)) + geom_boxplot() + theme_pub() + theme(axis.text.x = element_text(angle = 25, vjust = 0.4, hjust=0.5))

#Create a multi-panel plot showing frequency histograms for each species. 
require(gridExtra)
hist.m <- ggplot(measurements %>% filter(Species == "Drosophila melanogaster"), 
                aes(x=Limb.Volume)) + geom_histogram() + theme_pub() + ggtitle("Drosophila melanogaster") + xlab("") + ylab("") + 
                theme(plot.title = element_text(size=8, face="bold.italic"))
hist.p <- ggplot(measurements %>% filter(Species == "Drosophila pseudoobscura"), 
                aes(x=Limb.Volume)) + geom_histogram() + theme_pub() + ggtitle("Drosophila pseudoobscura") + xlab("") + ylab("") + 
                theme(plot.title = element_text(size=8, face="bold.italic"))
hist.s <- ggplot(measurements %>% filter(Species == "Drosophila subobscura"), 
                aes(x=Limb.Volume)) + geom_histogram() + theme_pub() + ggtitle("Drosophila subobscura") + xlab("") + ylab("") + 
                theme(plot.title = element_text(size=8, face="bold.italic"))
hist.v <- ggplot(measurements %>% filter(Species == "Drosophila virilis"), 
                aes(x=Limb.Volume)) + geom_histogram() + theme_pub() + ggtitle("Drosophila virilis") + xlab("") + ylab("") + 
                theme(plot.title = element_text(size=8, face="bold.italic"))
hist.z <- ggplot(measurements %>% filter(Species == "Drosophila suzukii"), 
                 aes(x=Limb.Volume)) + geom_histogram() + theme_pub() + ggtitle("Drosophila suzukii") + xlab("") + ylab("") + 
                 theme(plot.title = element_text(size=8, face="bold.italic"))


grid.arrange(hist.m, hist.p, hist.s, hist.v, hist.z, ncol=2, layout_matrix = cbind(c(1,2,3), c(4,5,NA)), 
             bottom = "Limb Volume", left = "Frequency")