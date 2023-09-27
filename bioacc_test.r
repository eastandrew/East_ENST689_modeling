library(rbioacc)
library(readr)
library(tidyverse)
dataf <- read_csv("C:/Users/easta/Desktop/ENST689_toads/East_ENST689_modeling-main/toad_stacked_data_subset_East_07SEP2023.csv")
head(dataf)
dataf <- dataf |> 
  filter(tissue=="liver"&PFAS=="8:2 FTS") |>
  rename(time=day,
         conc=concentration_ug_per_kg) |>
  mutate(expf=300,
         replicate=toadID)

modeldf <- modelData(dataf, time_accumulation=28)  
fitmoddf <- fitTK(modeldf, iter=10000)

plot(fitmoddf)
quantile_table(fitmoddf)
