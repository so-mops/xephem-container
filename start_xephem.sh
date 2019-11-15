#!/bin/bash

xhost +vattocs.vatt
mkdir -p ${HOME}/.xephem/catalogs
docker run  -v ${HOME}/.xephem:${HOME}/.xephem -v /tmp/.X11-unix:/tmp/.X11-unix -e XEHOME=${HOME}/.xephem -e DISPLAY=10.0.2.6:3.0 srswinde/xephem
xhost -vattocs.vatt
