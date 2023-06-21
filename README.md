## Space Telescope Science Institute Environment Docker Image
-------------------------------------------------------------

Processing and analysing Hubble Space Telescope (HST) & James Webb Space Telescope (JWST) often requires access to 
tools developed and maintained by the Space Telescope Science Institute (STScI), avilable through their `Conda`
environment `stenv`: [stenv.readthedocs.io](https://stenv.readthedocs.io)

I'm often hesitant to install big software packeges on my laptop, especially when I'm not sure how much I'll end up
using it. Thus was this repo born!

### Features
------------
- Fully functional STScI `stenv` in a docker container
- Jupyter Lab access to `stenv` via the docker container

### Usage
---------
One can either pull the `stenv` docker container form: [hub.docker.com](https://hub.docker.com/), 
or build the image locally.

##### 1. Docker Hub
`docker pull achokshi/stenv`

##### 2. Build Image
```
git clone 
```

docker run --rm -it -v ~/Repos/trainwreck:/root/ -p 8888:8888 stenv
jupyter notebook --allow-root --ip='*' --port=8888
