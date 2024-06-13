FROM rocker/verse:4.2.1
# OS: GNU/Linux Ubuntu 20.04 LTS (focal fossa)

RUN R -e "install.packages('devtools')"

# For plotting ...
RUN \
  R -e "install.packages(c('cowplot', 'ggrepel', 'ggplot2', 'circlize', 'viridis', 'viridisLite'))" && \
  R -e "devtools::install_github('jokergoo/ComplexHeatmap@ae0ec42cd2e4e0446c114d23dcf43cf2c2f585c8')" #version 2.15.4, untagged, using last commit for which all testing checks passed

# For making quality png rasters for ComplexHeatmaps
RUN R -e "install.packages('magick', ref = '2.7.3')"

# For xgtree models used in ImmuneSubtypes package
RUN R -e "devtools::install_version('xgboost', version='1.0.0.1')"

# The ImmuneSubtypeClassifier ... the main reason for this image
RUN R -e "devtools::install_github('CRI-iAtlas/ImmuneSubtypeClassifier')"

# Provides a parallel backend for the %dopar% function using the multicore functionality of the parallel package.
RUN R -e "install.packages('doMC', ref = '1.3.8')"

# Adding the lab packages last because we update them often
RUN R -e "devtools::install_github('benjamin-vincent-lab/housekeeping', ref = '0.3.5')" # needs to go first as the others use it
RUN R -e "devtools::install_github('benjamin-vincent-lab/binfotron', ref = '0.10.3')"