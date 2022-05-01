#!/bin/bash
app_dir=$HOME/my_project/dasa-fashion/app
gem_dir=$HOME/my_project/dasa-fashion/.gem
db_dir=$HOME/my_project/dasa-fashion/.data
docker network create --driver bridge rails_network
docker run --rm -d -p 3000:3000 -p 1080:1080 -p 1025:1025 -v ${app_dir}:/home/rails/app -v gem_volume:/home/rails/.rbenv/versions/2.5.1 --net=rails_network -h app -it --name rails_web rails_web /bin/bash
docker run --rm -d -v ${db_dir}:/var/lib/postgresql/data --net=rails_network -h db --name rails_db rails_db