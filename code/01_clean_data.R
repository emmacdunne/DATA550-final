here::i_am("code/01_clean_data.R")

library(readr)
library(dplyr)

data <- read_csv(
  file = here::here("data", "vitamin_deficiency_disease_dataset_20260123.csv")
)

data_clean <- data |>
  mutate(
    disease_status = ifelse(disease_diagnosis == "Healthy", "Healthy", "Diseased"),
    disease_status = factor(disease_status, levels = c("Healthy", "Diseased"))
  )

saveRDS(
  data_clean,
  file = here::here("output/data_clean.rds")
)