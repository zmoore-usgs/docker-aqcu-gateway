FROM openjdk:8-jdk-alpine

RUN set -x & \
  apk update && \
  apk upgrade && \
  apk add --no-cache curl && \
  apk --no-cache add openssl

ARG repo_name=aqcu-maven-centralized
ARG artifact_id=aqcu-gateway
ARG artifact_version=LATEST

ADD pull-from-artifactory.sh pull-from-artifactory.sh
RUN ["chmod", "+x", "pull-from-artifactory.sh"]

RUN sh pull-from-artifactory.sh ${repo_name} gov.usgs.aqcu ${artifact_id} ${artifact_version} app.jar
RUN rm -rf pull-from-artifactory.sh

ADD entrypoint.sh entrypoint.sh
RUN ["chmod", "+x", "entrypoint.sh"]

ENTRYPOINT [ "/entrypoint.sh" ]

HEALTHCHECK CMD curl -k "https://127.0.0.1:${serverPort}${serverContextPath}/health" | grep -q '{"status":"UP"}' || exit 1