#!/bin/sh
# Roda o contêiner Docker do Carnê-Leão: aureliojargas/carne-leao

set -eu

data_dir="$HOME/ProgramasRFB"

test -d "$data_dir" || mkdir "$data_dir"

xhost +local:docker

if command -v docker-compose >/dev/null 2>&1
then
    docker-compose up
else
    docker run --rm \
        -e DISPLAY \
        -e _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on' \
        -v /tmp/.X11-unix:/tmp/.X11-unix \
        -v "$data_dir":/home/leao/ProgramasRFB \
        aureliojargas/carne-leao
fi

xhost -local:docker
