FROM openjdk:8-jre-alpine

ARG BUILD_DATE
ARG VCS_REF
ARG VERSION

LABEL \
    org.label-schema.name="jjuarez/java-docker-cgroups" \
    org.label-schema.description="JVM process experiment against cgroups constrains" \
    org.label-schema.url="https://github.com/jjuarez/java-docker-cgroups" \
    org.label-schema.vcs="https://github.com/jjuarez/java-docker-cgroups.git" \
    org.label-schema.vcs-type="Git" \
    org.label-schema.docker.dockerfile="Dockerfile" \
    org.label-schema.license="MIT" \
    org.label-schema.build-date=${BUILD_DATE} \
    org.label-schema.vcs-ref=${VCS_REF} \
    org.label-schema.version=${VERSION}

ENV APP_HOME /opt/app

COPY build/libs/java-docker-cgroups.jar ${APP_HOME}/
COPY src/main/resources/docker/entrypoint.sh ${APP_HOME}/

ENTRYPOINT [ "/opt/app/entrypoint.sh" ]
