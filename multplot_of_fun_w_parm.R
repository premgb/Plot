##############################################################################################################################
# multiple plots of a function in the same figure using various parameters (also an alternative to multiple stat_function()) #
##############################################################################################################################
#
library(dplyr)
library(ggplot2)

df <- data.frame(mean = rep(0,10),
                 sd = c(0.1, 0.15, 0.2, 0.25, 0.3, 0.35, 1, 1.5, 2, 2.5))
col <- c(palette(), "orange", "pink");

x <- seq(0,2,0.01)
my_func <- mdply(df, function(mean,sd){
  data.frame(x=x, y=dlnorm(x,mean, sd), SD=as.character(sd))}) %>% 
  bind_rows

ggplot(my_func, aes(x=x, y=y, colour=SD)) + 
  geom_line() +
  scale_colour_manual(values=col) +
  theme_bw()
