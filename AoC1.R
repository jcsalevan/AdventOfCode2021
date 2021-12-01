library(tidyverse)
library(readr)

AoC1 = read_csv("AoC1.txt", col_names = F) %>%
  rename(readings = X1) %>%
  mutate(rmean = zoo::rollmean(readings, k = 3, fill = NA),
         d_readings = c(NA, diff(readings)),
         d_rmean = c(NA, diff(rmean)),
         
         sign_d_read = d_readings > 0,
         sign_d_rmean = d_rmean > 0
         ) %>%
  summarize(
    pt1 = sum(sign_d_read, na.rm = T),
    pt2 = sum(sign_d_rmean, na.rm = T)
  )
