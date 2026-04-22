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
  - includes rules to locally generate the report and rules for Docker report generation
- `Dockerfile`
  - builds the Docker image used to fully reproduce the report

# Generating the Final Report

To generate the final report, run:

`make`

This command runs the scripts in `code/` and produces the final report in:

`output/final_report.html`

# Build the Docker Image

To build the Docker image locally, run:

`docker build -t emmadunne/data550-final .`

# DockerHub Image

Public DockerHub repository:

`https://hub.docker.com/r/emmadunne/data550-final`

# Generate the Report with Docker

To generate the report using the Docker image, run:

On Mac/Linux:

`make report`

On Windows:

`make report_windows`

This command runs the container and saves the compiled report in the local report folder.

After the command finishes, the compiled report will be available in:

`report/final_report.html`