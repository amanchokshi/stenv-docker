FROM continuumio/miniconda3:latest

MAINTAINER Aman Chokshi <achokshi@student.unimelb.edu.au>

SHELL ["/bin/bash", "--login", "-c"]

RUN apt-get -y update \
    && apt-get install -y build-essential wget \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && apt-get autoremove \
    && apt-get clean

WORKDIR /root

ARG STENV_URL=https://github.com/spacetelescope/stenv/releases/download/2023.06.08/stenv-Linux-X64-py3.11-2023.06.08.yaml

RUN wget ${STENV_URL} \
    && echo '      - jupyterlab==4.0.2' >> stenv*.yaml \
    && echo '      - ipympl==0.9.3' >> stenv*.yaml \
    && conda env create --file stenv*.yaml --name stenv \
    && rm stenv*.yaml

RUN echo 'conda activate stenv' >> /etc/profile

ENTRYPOINT /bin/bash -l
