#!/usr/bin/env bash
# required docker login
docker tag vw.demo.helloworld:latest voyagerwoo/vw.demo.helloworld:latest
docker push voyagerwoo/vw.demo.helloworld:latest