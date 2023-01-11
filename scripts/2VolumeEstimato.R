#Write an R script called volumeEstimato.R that will read a file called  measurements.csv
measurements <- read.csv(file = "/Users/ht/0/Stats/2 Colautti_812/trial_repo/data/measurements.csv")

#Getting rid of the extra indexing column, when the file is recalled
if (names(measurements)[1] == "X") {measurements <- measurements[,-1]}

#Then estimate a limb volume from the two limb measurements. 
volume <- function(l,w) {v <- pi*(w/2)^2*l; return(v)}

#Over-write the original measurements.csv file so that it now contains a Volume column.
measurements$Limb.Volume <- volume(measurements$Limb.Length, measurements$Limb.Width)

#Use dplyr to sort the data by species, then by observer, then by limb volume
require("tidyverse")
measurements <- data.frame(measurements %>% arrange(Species, Observer, Limb.Volume))
measurements$Species <- as.factor(measurements$Species)
write.csv(measurements, file = "/Users/ht/0/Stats/2 Colautti_812/trial_repo/data/measurements.csv")