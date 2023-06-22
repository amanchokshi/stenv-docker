FROM continuumio/miniconda3:latest

MAINTAINER Aman Chokshi <achokshi@student.unimelb.edu.au>

SHELL ["/bin/bash", "--login", "-c"]

RUN apt-get -y update \
    && apt-get install -y build-essential wget \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && apt-get autoremove \
    && apt-get clean

WORKDIR /root

ARG STENV_URL=https://raw.githubusercontent.com/spacetelescope/stenv/main/environment.yaml

RUN wget ${STENV_URL} \
    && echo '      - jupyterlab' >> environment.yaml \
    && echo '      - ipympl' >> environment.yaml \
    && conda env create --file environment.yaml --name stenv \
    && rm environment.yaml

RUN echo 'conda activate stenv' >> ~/.bashrc

ENTRYPOINT /bin/bash -l
