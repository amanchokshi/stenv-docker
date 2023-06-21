## Space Telescope Science Institute Environment Docker Image
-------------------------------------------------------------

Processing and analysing Hubble Space Telescope (HST) & James Webb Space Telescope (JWST) often requires access to 
tools developed and maintained by the Space Telescope Science Institute (STScI), avilable through their `Conda`
environment `stenv`: [stenv.readthedocs.io](https://stenv.readthedocs.io)

I'm often hesitant to install big software packeges on my laptop, especially when I'm not sure how much I'll end up
using it. Thus was this repo born!

### Features
- Fully functional STScI `stenv` in a docker container
- Jupyter Lab access to `stenv` via the docker container

### Usage
One can either pull the `stenv` docker container form: [hub.docker.com](https://hub.docker.com/), 
or build the image locally.

##### 1. Docker Hub
`docker pull achokshi/stenv`

##### 2. Build Image
```
git clone git@github.com:amanchokshi/stenv-docker.git
docker build -t stenv -f Dockerfile .
```

##### 3. Running the Container
Run the docker container with:
`docker run --rm -it -v <VOLUME>:/root/ -p 8888:8888 stenv`
This mounts a local `<VOLUME>` to the root directory of the docker container making data or notebooks accessible from within. 
Port `8888` is exposed to allow for Jupyter connections

When the container is activated, the `stenv` conda environment is already active, as seen in the prompt

`(stenv) root@22c6856788e2:~#`

You can either work directly from the terminal, or spin up a Jupyter Lab session with:

`jupyter-lab --allow-root --ip='*' --port=8888`

which should be accessible from a browser at [localhost:8888/lab](http://localhost:8888/lab)
