###################################################
# How to use custom image as bars in a bar chart? #
###################################################
#
library(jpeg)
library(grid)
library(lattice)

#download Chrismas tree image which will be used as bar in barplot
download.file("https://upload.wikimedia.org/wikipedia/commons/f/fa/Poinsettia_tree.jpg", "Poinsettia_tree.jpg")
chrismas_tree <- readJPEG("Poinsettia_tree.jpg")

#sample data for barplot
counts <- table(mtcars$gear)

#barplot
barchart(counts, origin=0, col="white",horizontal = FALSE,
             panel=function(x, y, ...) {
             panel.barchart(x, y, ...)
             grid.raster(chrismas_tree, y=0, height=y, x=x,
                               default.units="native", 
                               just="bottom",
                               width=unit(0.2,"npc"))
             },
         ylab = "Counts",
         xlab = "Gear",
         main = "Gear counts plot (mtcars)")
