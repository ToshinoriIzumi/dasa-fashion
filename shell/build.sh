#!/bin/bash
docker_dir=$HOME/rails_sample/docker
docker build ${docker_dir}/app -t rails_web
docker build ${docker_dir}/db -t rails_db
ls