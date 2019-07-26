ARG BASE_CONTAINER=jupyter/base-notebook
FROM $BASE_CONTAINER

USER root

RUN apt-get update && apt-get -yq dist-upgrade 

#RUN apt-get && apt-get -y python3 python3-pip

#RUN pip install pandas && apt-get install wget

# Install Python 3 packages
RUN conda install --quiet --yes \
    'conda-forge::blas=*=openblas' \
    'ipywidgets=7.5*' \
    'pandas=0.24*' \
    'numexpr=2.6*' \
    'matplotlib=3.0*' \
#    'scipy=1.2*' \
#    'seaborn=0.9*' \
#    'scikit-learn=0.20*' \
#    'scikit-image=0.14*' \
#    'sympy=1.3*' \
#    'cython=0.29*' \
#    'patsy=0.5*' \
#    'statsmodels=0.9*' \
#    'cloudpickle=0.8*' \
#    'dill=0.2*' \
#    'dask=1.1.*' \
    'numba=0.42*' \
#    'bokeh=1.0*' \
#    'sqlalchemy=1.3*' \
#    'hdf5=1.10*' \
#    'h5py=2.9*' \
#    'vincent=0.4.*' \
#    'beautifulsoup4=4.7.*' \
#    'protobuf=3.7.*' \
    'xlrd'  && \
    conda clean --all -f -y

# Install snakemake
RUN conda install -y -c conda-forge -c bioconda snakemake-minimal


# Run snakemake
#RUN cd project_hydrology

USER $NB_UID
