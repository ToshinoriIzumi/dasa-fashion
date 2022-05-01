#!/bin/bash

docker stop rails_web
docker stop rails_db
docker network rm rails_network