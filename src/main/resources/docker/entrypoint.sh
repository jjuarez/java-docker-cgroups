#!/bin/sh

# Configuration
WORKDIR=/opt/app
APP_JAR=${WORKDIR}/java-docker-cgroups.jar

# Paramters
ENTRYPOINT_PARAMETER="${1}"
JAVA_OPTS=""

case ${ENTRYPOINT_PARAMETER} in
  -x|-X)
    JAVA_OPTS="-XX:+UnlockExperimentalVMOptions -XX:+UseCGroupMemoryLimitForHeap -XX:MaxRAMFraction=2 -XX:+UseG1GC"
  ;;
esac

java -XX:+PrintFlagsFinal -version
java ${JAVA_OPTS} -jar ${APP_JAR}