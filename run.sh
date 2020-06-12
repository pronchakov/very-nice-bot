#!/bin/bash

docker build -t registry.gitlab.com/pronchakov/very-nice-bot:latest .
docker login -u {} -p {} registry.gitlab.com
docker pull registry.gitlab.com/pronchakov/very-nice-bot:latest
docker run -it --rm --name=fuckyouer-bot -e --cpuset-cpus=1 --memory=256mm -e VM_PARAMS="-Dcamel.component.telegram.authorization-token={}" registry.gitlab.com/pronchakov/very-nice-bot:latest