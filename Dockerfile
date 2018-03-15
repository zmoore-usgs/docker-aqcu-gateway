FROM openjdk:8-jdk-alpine

RUN set -x & \
  apk update && \
  apk upgrade && \
  apk add --no-cache curl && \
  apk --no-cache add openssl

ARG nexus_repo=cida-public-snapshots
ARG artifact_id=aqcu-gateway
ARG artifact_version=LATEST
RUN curl -k -o app.jar -X GET "https://internal.cida.usgs.gov/maven/service/local/artifact/maven/content?r=${nexus_repo}&g=gov.usgs.aqcu&a=${artifact_id}&v=${version}&e=jar"

EXPOSE 443

ADD entrypoint.sh entrypoint.sh
RUN ["chmod", "+x", "entrypoint.sh"]

ENTRYPOINT [ "/entrypoint.sh" ]