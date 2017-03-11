#!/bin/sh

(cat Dockerfile ; echo "RUN adduser $LOGNAME") \
    | docker build -t $USER/slic3r:fedora -
