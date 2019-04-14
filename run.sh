#!/bin/sh
# Run the lastest Carnê-Leão docker image.

set -eu

data_dir="$HOME/ProgramasRFB"

test -d "$data_dir" || mkdir "$data_dir"

xhost +local:docker

docker run --rm \
    -e DISPLAY \
    -e _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on' \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v "$data_dir":/home/leao/ProgramasRFB \
    aureliojargas/carne-leao

xhost -local:docker
