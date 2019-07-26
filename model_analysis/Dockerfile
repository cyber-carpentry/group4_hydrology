FROM jupyter/r-notebook

USER root

COPY *.r /home/$NB_USER

RUN Rscript model_flood_counts_rf_ps_cln.r
