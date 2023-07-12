FROM rocker/verse:4.3.0
RUN apt-get update && apt-get install -y  cmake libcurl4-openssl-dev libfribidi-dev libharfbuzz-dev libicu-dev libpng-dev libsodium-dev libssl-dev libtiff-dev libxml2-dev make pandoc zlib1g-dev && rm -rf /var/lib/apt/lists/*
RUN mkdir -p /usr/local/lib/R/etc/ /usr/lib/R/etc/
RUN echo "options(repos = c(CRAN = 'https://cran.rstudio.com/'), download.file.method = 'libcurl', Ncpus = 4)" | tee /usr/local/lib/R/etc/Rprofile.site | tee /usr/lib/R/etc/Rprofile.site
RUN R -e 'install.packages("remotes")'
RUN Rscript -e 'remotes::install_version("magrittr",upgrade="never", version = "2.0.3")'
RUN Rscript -e 'remotes::install_version("rlang",upgrade="never", version = "1.1.1")'
RUN Rscript -e 'remotes::install_version("dplyr",upgrade="never", version = "1.1.2")'
RUN Rscript -e 'remotes::install_version("pkgload",upgrade="never", version = "1.3.2")'
RUN Rscript -e 'remotes::install_version("tidyr",upgrade="never", version = "1.3.0")'
RUN Rscript -e 'remotes::install_version("ggrepel",upgrade="never", version = "0.9.3")'
RUN Rscript -e 'remotes::install_version("rmarkdown",upgrade="never", version = "2.21")'
RUN Rscript -e 'remotes::install_version("DT",upgrade="never", version = "0.28")'
RUN Rscript -e 'remotes::install_version("shiny",upgrade="never", version = "1.7.4")'
RUN Rscript -e 'remotes::install_version("readr",upgrade="never", version = "2.1.4")'
RUN Rscript -e 'remotes::install_version("data.table",upgrade="never", version = "1.14.8")'
RUN Rscript -e 'remotes::install_version("FactoMineR",upgrade="never", version = "2.8")'
RUN Rscript -e 'remotes::install_version("config",upgrade="never", version = "0.3.1")'
RUN Rscript -e 'remotes::install_version("shinyscreenshot",upgrade="never", version = "0.2.0")'
RUN Rscript -e 'remotes::install_version("factoextra",upgrade="never", version = "1.0.7")'
RUN Rscript -e 'remotes::install_version("ggfortify",upgrade="never", version = "0.4.16")'
RUN Rscript -e 'remotes::install_version("shinydashboard",upgrade="never", version = "0.7.2")'
RUN Rscript -e 'remotes::install_version("genefilter",upgrade="never", version = "1.82.1")'
RUN Rscript -e 'remotes::install_version("ggforce",upgrade="never", version = "0.4.1")'
RUN Rscript -e 'remotes::install_version("tidyverse",upgrade="never", version = "2.0.0")'
RUN Rscript -e 'remotes::install_version("janitor",upgrade="never", version = "2.2.0")'
RUN Rscript -e 'remotes::install_version("golem",upgrade="never", version = "0.4.1")'
RUN Rscript -e 'remotes::install_github("cran/DMwR@6fd4f0cd7a724f77586265f18e1a02cb48422bfc")'
RUN Rscript -e 'remotes::install_github("paulc91/shinyauthr@c6537bbb1d13ac54b438bd64f72599fd607acce5")'
RUN mkdir /build_zone
ADD . /build_zone
WORKDIR /build_zone
RUN R -e 'remotes::install_local(upgrade="never")'
RUN rm -rf /build_zone
EXPOSE 80
CMD R -e "options('shiny.port'=80,shiny.host='0.0.0.0');library(lof);lof::run_app()"
