FROM mambaorg/micromamba:latest

MAINTAINER Aman Chokshi <achokshi@student.unimelb.edu.au>

USER root

SHELL ["/bin/bash", "--login", "-c"]

RUN apt-get -y update \
    && apt-get install -y build-essential wget \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && apt-get autoremove \
    && apt-get clean

WORKDIR /root

ARG STENV_URL=https://raw.githubusercontent.com/spacetelescope/stenv/main/environment.yaml

RUN wget ${STENV_URL} \
    && micromamba create -y --name stenv --file environment.yaml jupyterlab==4.0.2 ipympl==0.9.3 \
    && rm environment.yaml

RUN echo 'micromamba activate stenv' >> ~/.bashrc

ENTRYPOINT /bin/bash -l
