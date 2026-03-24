here::i_am("code/02_make_table.R")

library(dplyr)
library(labelled)
library(gtsummary)

data <- readRDS(
  file = here::here("output/data_clean.rds")
)

var_label(data) <- list(
  age = "Age (years)",
  gender = "Gender",
  bmi = "BMI",
  exercise_level = "Exercise level",
  diet_type = "Diet type",
  vitamin_a_percent_rda = "Vitamin A (% RDA)",
  vitamin_c_percent_rda = "Vitamin C (% RDA)",
  vitamin_d_percent_rda = "Vitamin D (% RDA)",
  vitamin_b12_percent_rda = "Vitamin B12 (% RDA)",
  folate_percent_rda = "Folate (% RDA)",
  calcium_percent_rda = "Calcium (% RDA)",
  iron_percent_rda = "Iron (% RDA)",
  hemoglobin_g_dl = "Hemoglobin (g/dL)",
  serum_vitamin_d_ng_ml = "Serum vitamin D (ng/mL)",
  serum_vitamin_b12_pg_ml = "Serum vitamin B12 (pg/mL)",
  serum_folate_ng_ml = "Serum folate (ng/mL)",
  has_multiple_deficiencies = "Multiple deficiencies"
)

table1 <- data |>
  select(
    disease_status,
    age,
    gender,
    bmi,
    exercise_level,
    diet_type,
    vitamin_a_percent_rda,
    vitamin_c_percent_rda,
    vitamin_d_percent_rda,
    vitamin_b12_percent_rda,
    folate_percent_rda,
    calcium_percent_rda,
    iron_percent_rda,
    hemoglobin_g_dl,
    serum_vitamin_d_ng_ml,
    serum_vitamin_b12_pg_ml,
    serum_folate_ng_ml,
    has_multiple_deficiencies
  ) |>
  tbl_summary(
    by = disease_status,
    statistic = list(
      all_continuous() ~ "{mean} ({sd})",
      all_categorical() ~ "{n} ({p}%)"
    )
  ) |>
  modify_spanning_header(c("stat_1", "stat_2") ~ "**Disease status**") |>
  add_overall() |>
  add_p()

saveRDS(
  table1,
  file = here::here("output/table1.rds")
)