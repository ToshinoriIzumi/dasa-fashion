#!/bin/bash

docker stop rails_web
docker stop rails_db
docker stop api_web
docker network rm fashion_app_network