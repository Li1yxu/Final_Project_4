#make
obesity_report.html: obesity_report.Rmd code/03_render_report.R	\
	output/figure_1.rds \
	output/table_1.rds \
	output/table_data_1.rds
	Rscript code/03_render_report.R

output/table_data_1.rds: code/00_table1_data.R
	Rscript code/00_table1_data.R


output/table_1.rds: code/01_table1.R output/table_data_1.rds
	Rscript code/01_table1.R


output/figure_1.rds: code/02_figure1.R
	Rscript code/02_figure1.R


.PHONY: clean
clean:
	rm -rf output/*
	
.PHONY: install
install:
	Rscript -e "renv::restore(prompt = FALSE)"
	
#docker
PROJECTFILES = obesity_report.Rmd code/00_table1_data.R code/01_table1.R code/02_figure1.R code/03_render_report.R data/obesity_data.csv data/obesity_data.csv Makefile
RENVFILES = renv.lock renv/activate.R renv/settings.json

final_project_image: $(PROJECTFILES) $(RENVFILES)
	docker build -t final_project_image .
	touch $@

final_report/obesity_report.html:
	docker run -v "$$(pwd)"//final_report:/project/final_report final_project_image

