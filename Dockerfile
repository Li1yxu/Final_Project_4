##Stage 1##

#development at the command line
FROM rocker/r-ubuntu as base

#install pandoc
RUN apt-get update && apt-get install -y pandoc

#create a project directory
RUN mkdir /project
WORKDIR /project

#create renv folder and copy renv-associated files
RUN mkdir -p renv
COPY renv.lock renv.lock
COPY .Rprofile .Rprofile
COPY renv/activate.R renv/activate.R
COPY renv/settings.json renv/settings.json

#change the default location of the renv cache
RUN mkdir renv/.cache
ENV RENV_PATHS_CACHE renv/.cache

#restore the package library
RUN R -e "renv::restore(prompt = FALSE)" 

##stage 2##

#create a second image
FROM rocker/r-ubuntu
WORKDIR /project
COPY --from=base /project .

#set an environment variable
ENV WHICH_CONFIG "default"

#copy other file
COPY Makefile Makefile
COPY obesity_report.Rmd obesity_report.Rmd

#create other directory
RUN mkdir -p code
RUN mkdir -p output
RUN mkdir -p data
RUN mkdir -p final_report

#copy file in data
COPY data/obesity_data.csv data/obesity_data.csv

#copy file in code
COPY code/00_table1_data.R code/00_table1_data.R
COPY code/01_table1.R code/01_table1.R
COPY code/02_figure1.R code/02_figure1.R
COPY code/03_render_report.R code/03_render_report.R

#install pandoc
RUN apt-get update && apt-get install -y pandoc

#add entry point
RUN mkdir final_report
CMD make && mv obesity_report.html final_report
