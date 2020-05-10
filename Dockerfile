FROM openjdk:8-jre-alpine

LABEL \
    org.label-schema.name="jjuarez/java-docker-cgroups" \
    org.label-schema.description="JVM process experiment against cgroups constrains" \
    org.label-schema.url="https://github.com/jjuarez/java-docker-cgroups" \
    org.label-schema.vcs="https://github.com/jjuarez/java-docker-cgroups.git" \
    org.label-schema.vcs-type="Git" \
    org.label-schema.docker.dockerfile="Dockerfile" \
    org.label-schema.license="MIT"

ENV VERBOSE=false

WORKDIR /opt/app

COPY build/libs/java-docker-cgroups-1.0.0-SNAPSHOT.jar ./app.jar
COPY entrypoint.sh ./
RUN chmod +x ./entrypoint.sh

ENTRYPOINT [ "/opt/app/entrypoint.sh" ]
