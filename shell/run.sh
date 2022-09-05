#!/bin/bash
api_dir=$HOME/my_project/dasa-fashion/api
app_dir=$HOME/my_project/dasa-fashion/app
db_dir=$HOME/my_project/dasa-fashion/.data
docker network create --driver bridge fashion_app_network
docker run --rm -d -p 8888:8888 -v ${api_dir}:/home/api_user/api -v conda_volume:/home/api_user/miniconda --net=fashion_app_network -h api -it --name api_web api_web /bin/bash
docker run --rm -d -p 3000:3000 -v ${app_dir}:/home/rails/app -v gem_volume:/home/rails/.rbenv/versions/2.5.1 --net=fashion_app_network -h app -it --name rails_web rails_web /bin/bash
docker run --rm -d -v ${db_dir}:/var/lib/postgresql/data --net=fashion_app_network -h db --name rails_db rails_db