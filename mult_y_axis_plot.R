###########################################################
# plot having multiple Y axis (using highcharter package) #
###########################################################
#
library(highcharter)
library(dplyr)

#sample data
set.seed(123)
df <- data.frame(x  = seq(1:50),
                 y1 = cumsum(rnorm(50, 100, 200)),
                 y2 = rnorm(50)) 

highchart() %>% 
  hc_yAxis(
    list(lineWidth = 3, lineColor='red', title=list(text="y1")),
    list(lineWidth = 3, lineColor="blue", title=list(text="y2"))
  ) %>% 
  hc_add_series(data = df$y1, color='red', type = "line") %>% 
  hc_add_series(data = df$y2, color='blue', type = "line", yAxis = 1) %>%
  hc_xAxis(categories = df$x, title = list(text = "x"))
