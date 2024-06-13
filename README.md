# rserver-immunesubtypes
hosts dockerfile for running immune subtypes package

## Introduction
This Dockerfile is used to run immune subtype functions.


## DockerHub link:  
https://hub.docker.com/repository/docker/benjaminvincentlab/rserver-immunesubtypes   


## Building locally
```bash
docker build -t benjaminvincentlab/rserver-immunesubtypes:4.2.1.55 .
```


## Running locally
```bash
docker run -e PASSWORD=12qwaszx --rm -p 8787:8787 -v ~/Desktop:/home/rstudio benjaminvincentlab/rserver-immunesubtypes:4.2.1.55
```
Then direct browser to localhost:8787. Your username is rstudio.


## Push to DockerHub
```bash
docker login
docker push benjaminvincentlab/rserver-immunesubtypes:4.2.1.1
```

## On cluster pull from DockerHub
```
sbatch -c 4 --mem 8g -p allnodes --wrap="apptainer pull docker://benjaminvincentlab/rserver-immunesubtypes-4.2.1.55"
```

## move it from the pullfolder to raft images
```
mv ${APPTAINER_PULLFOLDER}/rserver-immunesubtypes_4.2.1.55.sif /datastore/nextgenout5/share/labs/Vincent_Lab/tools/raft/imgs/benjaminvincentlab-rserver-immunesubtypes-4.2.1.55.img
```

## Running on the bioinf cluster with apptainer


Use [run_rserver](https://sc.unc.edu/benjamin-vincent-lab/scripts/run_rserver) to run it.  It will do all of the above steps for you.


## Decoding the tag structure
v.w.x.y 
vwx is the version of R.  
y is the version of this Dockerfile.  



