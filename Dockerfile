FROM openjdk:8-jdk-alpine

RUN set -x & \
  apk update && \
  apk upgrade && \
  apk add --no-cache curl && \
  apk --no-cache add openssl

ARG nexus_repo=cida-public-snapshots
ARG artifact_group=gov.usgs.aqcu
ARG artifact_id=aqcu-gateway
ARG artifact_version=0.0.1-SNAPSHOT
ARG artifact_packaging=war
#RUN curl -k -o app.war -X GET "https://internal.cida.usgs.gov/maven/service/local/artifact/maven/content?r=${nexus_repo}&g=${artifact_group}&a=${artifact_id}&v=${version}&e=${artifact_packaging}"
ADD aqcu-gateway.jar app.jar

EXPOSE 8443

ADD entrypoint.sh entrypoint.sh
RUN ["chmod", "+x", "entrypoint.sh"]

ENTRYPOINT [ "/entrypoint.sh" ]