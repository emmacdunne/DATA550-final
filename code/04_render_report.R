here::i_am("code/04_render_report.R")

library(rmarkdown)

render(
  "report.Rmd",
  output_file = here::here("output/final_report.html")
)