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