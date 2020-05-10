#!/bin/sh

# Parameters
ENTRYPOINT_PARAMETER="${1}"
VERBOSE=${VERBOSE:-"false"}
JAVA_OPTS=""

case ${ENTRYPOINT_PARAMETER} in
  -X)
    JAVA_OPTS="-XX:+UnlockExperimentalVMOptions -XX:+UseCGroupMemoryLimitForHeap -XX:MaxRAMFraction=2 -XX:+UseG1GC -XX:ParallelGCThreads=1" 
    ;;
esac

[ "${VERBOSE}" = "true" ] && java -XX:+PrintFlagsFinal -version

java ${JAVA_OPTS} -jar /opt/app/app.jar
