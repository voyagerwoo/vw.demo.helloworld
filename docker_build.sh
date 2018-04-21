#!/usr/bin/env bash

./gradlew build
PRJ_GROUP=$(gradle properties -q | grep "group:" | awk '{print $2}')
PRJ_NAME=$(gradle properties -q | grep "name:" | awk '{print $2}')
PRJ_VERSION=$(gradle properties -q | grep "version:" | awk '{print $2}')
PRJ_JAR=${PRJ_NAME}-${PRJ_VERSION}.jar

docker build -t ${PRJ_GROUP}.${PRJ_NAME}:latest \
    --build-arg JAR_FILE=build/libs/${PRJ_JAR} ./