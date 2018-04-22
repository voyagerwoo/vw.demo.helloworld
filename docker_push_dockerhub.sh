#!/usr/bin/env bash
# required docker login
docker login -e ${DOCKER_EMAIL} -u ${DOCKER_USER} -p ${DOCKER_PASS}
docker tag vw.demo.helloworld:latest voyagerwoo/vw.demo.helloworld:latest
docker push voyagerwoo/vw.demo.helloworld:latest