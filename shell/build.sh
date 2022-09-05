#!/bin/bash
docker_dir=$HOME/my_project/dasa-fashion/docker
docker build ${docker_dir}/api -t api_web
docker build ${docker_dir}/app -t rails_web
docker build ${docker_dir}/db -t rails_db
ls