#!/bin/sh
# Run the lastest Carnê-Leão docker image.

set -eu

data_dir="$HOME/ProgramasRFB"

# Make sure the data folder exists before running the container, otherwise
# 'docker run -v' will force its creation and it will be owned by root.
test -d "$data_dir" || mkdir "$data_dir"

# Why xhost? Read http://wiki.ros.org/docker/Tutorials/GUI
xhost +local:docker

docker run --rm \
    -e DISPLAY \
    -e _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on' \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v "$data_dir":/home/leao/ProgramasRFB \
    aureliojargas/carne-leao

xhost -local:docker
