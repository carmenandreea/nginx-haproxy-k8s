#!/bin/bash

PROJECT=$1

gcloud auth configure-docker

#build and upload haproxy image to GCR
docker build -t haproxy_image -f Dockerfile_haproxy .
docker tag haproxy_image gcr.io/$PROJECT/haproxy_image
docker push gcr.io/$PROJECT/haproxy_image

#build and upload nginx image to GCR
docker build -t nginx_iamge -f Dockerfile_nginx .
docker tag nginx_image gcr.io/$PROJECT/nginx_image
docker push gcr.io/$PROJECT/nginx_image
