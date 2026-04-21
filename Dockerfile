FROM rocker/tidyverse:4.5.1 as base

RUN mkdir /home/rstudio/project
WORKDIR /home/rstudio/project

RUN mkdir -p renv
COPY renv.lock renv.lock
COPY .Rprofile .Rprofile
COPY renv/activate.R renv/activate.R
COPY renv/settings.json renv/settings.json

RUN mkdir renv/.cache
ENV RENV_PATHS_CACHE renv/.cache

RUN Rscript -e "renv::restore(prompt = FALSE)"

###### DO NOT EDIT STAGE 1 BUILD LINES ABOVE  (this was from class) ######

FROM rocker/tidyverse:4.5.1

RUN mkdir /home/rstudio/project
WORKDIR /home/rstudio/project

COPY --from=base /home/rstudio/project .

COPY Makefile .
COPY report.Rmd .
COPY final.Rproj .

RUN mkdir -p code data output report

COPY data data
COPY code code

CMD Rscript code/01_clean_data.R && \
    Rscript code/02_make_table.R && \
    Rscript code/03_make_figure.R && \
    Rscript code/04_render_report.R && \
    mv output/final_report.html report/