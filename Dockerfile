FROM mambaorg/micromamba:latest

MAINTAINER Aman Chokshi <achokshi@student.unimelb.edu.au>

SHELL ["/bin/bash", "--login", "-c"]

RUN apt-get -y update \
    && apt-get install -y build-essential wget \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && apt-get autoremove \
    && apt-get clean

WORKDIR /root

ARG STENV_URL=https://github.com/spacetelescope/stenv/releases/download/2023.06.08/stenv-Linux-X64-py3.11-2023.06.08.yaml

RUN wget ${STENV_URL} &&
    micromamba create -y --name stenv --file stenv-*.yaml jupyterlab==4.0.2 ipympl==0.9.3 &&
    rm stenv-*.yaml

RUN echo 'micromamba activate stenv' >> ~/.bashrc

ENTRYPOINT /bin/bash -l
