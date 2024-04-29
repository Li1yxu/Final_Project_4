
## Project description

The contents of the report includes a description of the data set that I chose to analyze, a summary table that has descriptive statistics about the data set, and a figure analyzing of the relationship between age and BMI level.

## The repository includes:

  - `data folder` that contain data
  
  - `code folder` that contains codes
  
  - `output folder` that contains outputs
  
  - `Makefile`
  
  - `README.md`
  
  - `obesity_report.Rmd` for the generating the report
  
  - `obesity_report.html` as a report output

## In the code folder

  - `00_table1_data.R` and `01_table.R`generates the table
  
  - `02_figure1.R` generates the figure
  
  - `03_render_report.R` generates the report

## In the output folder

  - `table_data_1.rds` and `table_1.rds` stores the output of the table
  
  - `figure_1.rds` stores the output of the figure
  
## Instructions on making the report

Run the command `make obesity_report.html`

## Instructions on synchronizing the package repository

Install R and `renv` package. 
Run the command `make install` in the terminal within the project directory.

## Instructions on using the make target

Run the command `make final_project_image` to build the docker image

  - Mac users: modify the `make final_report/obesity_report.html` path to
  `"$$(pwd)"/final_report:/project/final_report`

  - Windows users: no modification needed, use `make final_report/obesity_report.html` directly
