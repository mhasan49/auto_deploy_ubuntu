#!/bin/bash

make clean
make install
make config
make docker
make ping
make docker_install

