###########################################################
# plot having multiple Y axis (using highcharter package) #
###########################################################
#
library(highcharter)
library(dplyr)

#sample data
set.seed(123)
x1 <- rnorm(50)
x2 <- cumsum(runif(50, 20, 30))
x3 <- cumsum(rnorm(50, 100, 200))

#plot
highchart() %>% 
  hc_add_series(data = x1, color="red") %>% 
  hc_add_series(data = x2, yAxis = 1, color="blue") %>% 
  hc_add_series(data = x3, yAxis = 2, color="green") %>%
  hc_yAxis(
    list(lineWidth = 1, lineColor="red",  title=list(text="Y_axis_1")),
    list(lineWidth = 1, lineColor="blue", title=list(text="Y_axis_2")),
    list(lineWidth = 1, lineColor="green",title=list(text="Y_axis_3"))
  )
