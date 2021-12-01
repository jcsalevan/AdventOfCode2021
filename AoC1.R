library(tidyverse)
library(readr)

#haha who needs to remember how to read in text as if it's anything but a csv
AoC1 = read_csv("AoC1.txt", col_names = F) %>%
  rename(readings = X1) %>%
  
  #ain't about to rewrite a rolling mean at midnight
  mutate(rmean = zoo::rollmean(readings, k = 3, fill = NA),
         
         #doing this a cleaner way is for chumps
         d_readings = c(NA, diff(readings)), 
         d_rmean = c(NA, diff(rmean)),
         
         sign_d_read = d_readings > 0,
         sign_d_rmean = d_rmean > 0
         ) %>%
  summarize(
    pt1 = sum(sign_d_read, na.rm = T),
    pt2 = sum(sign_d_rmean, na.rm = T)
  )
