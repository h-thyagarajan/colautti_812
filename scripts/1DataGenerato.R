#A vector with a set of 100 species names, randomly selected from a vector of 5 species names of your choosing.
v1 <- sample(c("Drosophila melanogaster", "Drosophila pseudoobscura", "Drosophila suzukii", "Drosophila subobscura", "Drosophila virilis"), 100, replace=T)

#A vector of 100 values for Limb_width, randomly selected using a distribution of your choice that makes sense for the width of limbs (e.g. no negative or zero values).
v2 <- rnorm(1000, 3, 0.4)

#A vector of 100 values for Limb_length, again randomly selected from a distribution of your choosing, but the numbers must make sense.
v3 <- rnorm(1000, 10, 1)

#A vector of 100 values for Observer, randomly selected from a vector of 3 names (you can use any names you like).
v4 <- sample(c("A", "B", "C"), 1000, replace=T)

#Combine all of the vectors into a data.frame or tibble object and export to a CSV file called measurements.csv
measurements <- data.frame(cbind(v1, v2, v3, v4))
colnames(measurements) <- c("Species","Limb Width","Limb Length","Observer")
write.csv(measurements, file="/Users/ht/0/Stats/2 Colautti_812/trial_repo/data/measurements.csv")