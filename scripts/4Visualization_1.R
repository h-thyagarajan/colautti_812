#Create a single box plot (or similar) to compare key features of the 
#distributions of volumes for each species. 

#Standard plotting
#See <http://www.sthda.com/english/wiki/ggplot2-box-plot-quick-start-guide-r-software-and-data-visualization>
bp <- boxplot(Limb.Volume ~ Species, data = measurements, col = c("gold", "darkgreen", "brown", "black", "darkblue"), xaxt = "n")
tick <- seq_along(bp$names)
axis(1, at = tick, labels = FALSE)
text(tick, 5, c("melanogaster", "pseudoobscura", "subobscura", "suzukii", "virilis"), 
     cex = 0.8, srt = 15, xpd = TRUE)
#(bp$names) - to pull names from the boxplot

#Super fancy plot 
#require("ggstatsplot")
#plt <- ggbetweenstats(
#  data = measurements,
#  x = Species,
#  y = Limb.Volume
#)

#plt <- plt + labs(x = "Species", y = "Limb Volume", title = "Distribution of limb volume across Drosophila species")
