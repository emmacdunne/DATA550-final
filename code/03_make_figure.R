here::i_am("code/03_make_figure.R")

library(ggplot2)

data <- readRDS(
  file = here::here("output/data_clean.rds")
)

figure1 <- ggplot(data, aes(x = diet_type, fill = disease_status)) +
  geom_bar() +
  theme_bw() +
  labs(
    title = "Diet Type With Disease Status",
    x = "Diet Type",
    y = "Count"
  )

ggsave(
  plot = figure1,
  file = here::here("output/figure1.png")
)