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
#Note that this may require you to add code to you R markdown file to change the 
#data from the wide to long format.









