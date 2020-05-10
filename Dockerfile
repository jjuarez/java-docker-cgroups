FROM openjdk:8-jre

LABEL \
    org.label-schema.name="jjuarez/java-docker-cgroups" \
    org.label-schema.description="JVM process experiment against cgroups constrains" \
    org.label-schema.url="https://github.com/jjuarez/java-docker-cgroups" \
    org.label-schema.vcs="https://github.com/jjuarez/java-docker-cgroups.git" \
    org.label-schema.vcs-type="Git" \
    org.label-schema.docker.dockerfile="Dockerfile" \
    org.label-schema.license="MIT"

ENV APP_HOME=/opt/app
ENV SERVICE_NAME=java-docker-cgroups

WORKDIR ${APP_HOME}

COPY build/libs/${SERVICE_NAME}.jar ./
COPY src/main/resources/docker/entrypoint.sh ./
RUN chmod +x ./entrypoint.sh

ENTRYPOINT [ "/opt/app/entrypoint.sh" ]
