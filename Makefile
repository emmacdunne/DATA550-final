output/final_report.html: code/01_clean_data.R code/02_make_table.R code/03_make_figure.R code/04_render_report.R report.Rmd data/vitamin_deficiency_disease_dataset_20260123.csv	
	Rscript code/01_clean_data.R
	Rscript code/02_make_table.R
	Rscript code/03_make_figure.R
	Rscript code/04_render_report.R
	
install:
	Rscript -e "renv::restore()"