#Create a multi-panel plot showing frequency histograms for each species. 
require(gridExtra)
hist.m <- ggplot(measurements %>% filter(Species == "Drosophila melanogaster"), 
  aes(x=Limb.Volume)) + xlim(0,max(measurements$Limb.Volume)+10) + geom_histogram(bins = 30, color="gold", fill="white") + 
  theme_pub() + ggtitle("Drosophila melanogaster") + xlab("") + ylab("") + 
  theme(plot.title = element_text(size=8))

hist.p <- ggplot(measurements %>% filter(Species == "Drosophila pseudoobscura"), 
  aes(x=Limb.Volume)) + xlim(0,max(measurements$Limb.Volume)+10) + geom_histogram(bins = 30, color="darkgreen", fill="white") + 
  theme_pub() + ggtitle("Drosophila pseudoobscura") + xlab("") + ylab("") + 
  theme(plot.title = element_text(size=8))

hist.s <- ggplot(measurements %>% filter(Species == "Drosophila subobscura"), 
  aes(x=Limb.Volume)) + xlim(0,max(measurements$Limb.Volume)+10) + geom_histogram(bins = 30, color="brown", fill="white") + 
  theme_pub() + ggtitle("Drosophila subobscura") + xlab("") + ylab("") + 
  theme(plot.title = element_text(size=8))

hist.v <- ggplot(measurements %>% filter(Species == "Drosophila virilis"), 
  aes(x=Limb.Volume)) + xlim(0,max(measurements$Limb.Volume)+10) + geom_histogram(bins = 30, color="darkblue", fill="white") + 
  theme_pub() + ggtitle("Drosophila virilis") + xlab("") + ylab("") + 
  theme(plot.title = element_text(size=8))

hist.z <- ggplot(measurements %>% filter(Species == "Drosophila suzukii"), 
  aes(x=Limb.Volume)) + xlim(0,max(measurements$Limb.Volume)+10) + geom_histogram(bins = 30, color="black", fill="white") + 
  theme_pub() + ggtitle("Drosophila suzukii") + xlab("") + ylab("") + 
  theme(plot.title = element_text(size=8))


grid.arrange(hist.m, hist.p, hist.s, hist.v, hist.z, ncol=2, layout_matrix = cbind(c(1,2,3), c(4,5,NA)), 
             bottom = "Limb Volume", left = "Frequency")