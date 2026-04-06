## Package setup

This project uses `renv` to manage package versions.

To restore the required R package environment, run:

`make install`

# Project Description

This repository contains the final project analysis and report.

- `data/` contains the dataset used in the analysis
	- `data/vitamin_deficiency_disease_dataset_20260123.csv`
		- raw dataset used for the project
- `code/` contains the scripts used to create the cleaned data, required table, required figure, and final report
	- `code/01_clean_data.R`
		- reads in the raw dataset from `data/`
		- creates the cleaned analysis dataset
		- saves the cleaned data to `output/data_clean.rds`
	- `code/02_make_table.R`
		- reads in the cleaned dataset
		- creates the required summary table
		- saves the table to `output/table1.rds`
	- `code/03_make_figure.R`
		- reads in the cleaned dataset
		- creates the required figure
		- saves the figure to `output/figure1.png`
	- `code/04_render_report.R`
		- renders the final report from the command line
- `report.Rmd`
	- reads in the saved table and figure from `output/`
	- presents the final written report
- `output/`
	- contains generated output files used in the report
	- includes the cleaned dataset, required table, required figure, and rendered final report
- `Makefile`
	- builds the final report from the command line

# Generating the Final Report

To generate the final report, run:

`make`

This command runs the scripts in `code/` and produces the final report in:

`output/final_report.html`