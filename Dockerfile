ARG BASE_CONTAINER=jupyter/datascience-notebook
FROM $BASE_CONTAINER

LABEL maintainer="Yuske Yachi <yusuke.yachi@gmail.com>"

# Install Stan
RUN conda install --quiet --yes \
    'r-rstan' \
    'mkl-service' \
    'conda-forge::python-graphviz' \
    'conda-forge::pystan' \
    'conda-forge::pymc3' && \
    conda clean --all -f -y && \
    fix-permissions $CONDA_DIR && \
    fix-permissions /home/$NB_USER
