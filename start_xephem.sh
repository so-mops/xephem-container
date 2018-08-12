#!/bin/bash

xhost +local:root
mkdir -p ${HOME}/.xephem
docker run  --network host -v ${HOME}/.xephem:${HOME}/.xephem -v /tmp/.X11-unix:/tmp/.X11-unix -e XEHOME=${HOME}/.xephem -e DISPLAY=$DISPLAY srswinde/xephem
xhost -local:root
