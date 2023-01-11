#Load the revised measurements.csv
measurements <- read.csv(file = "/Users/ht/0/Stats/2 Colautti_812/trial_repo/data/measurements.csv")
#Getting rid of the extra indexing column, when the file is recalled
if (names(measurements)[1] == "X") {measurements <- measurements[,-1]}

require("dplyr")
#Create a table showing the average volume for each species
measurements.summary <- data.frame(measurements %>% group_by(Species) %>% summarise(Mean.Volume=mean(Limb.Volume), StdDev.Volume=sd(Limb.Volume), Count=n()))
print(measurements.summary)

#Create a table showing the number of observations (i.e. rows) for each 
#combination of species and observer.
observer.summary <- data.frame(measurements %>% group_by(Observer) %>% summarise(Count=n()))
print(observer.summary)
