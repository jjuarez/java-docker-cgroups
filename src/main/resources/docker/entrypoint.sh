#!/bin/sh

[ "${1}" = "-x" ] && {
  export JAVA_OPTS="-XX:+UnlockExperimentalVMOptions -XX:+UseCGroupMemoryLimitForHeap -XX:MaxRAMFraction=1 -XX:+UseG1GC -XX:ParallelGCThreads=1"
}

java ${JAVA_OPTS} -jar /opt/app/java-docker-cgroups.jar
