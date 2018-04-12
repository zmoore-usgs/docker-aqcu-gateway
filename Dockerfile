FROM cidasdpdasartip.cr.usgs.gov:8447/aqcu/aqcu-base:latest

ENV repo_name=aqcu-maven-centralized
ENV artifact_id=aqcu-gateway
ENV artifact_version=0.0.1-SNAPSHOT

RUN ./pull-from-artifactory.sh ${repo_name} gov.usgs.aqcu ${artifact_id} ${artifact_version} app.jar

ADD launch-app.sh launch-app.sh
RUN ["chmod", "+x", "launch-app.sh"]

#Default ENV Values
ENV serverPort=443
ENV legacyServerList=http://localhost:8443
ENV tssReportServerList=http://localhost:8444
ENV dvhydroReportServerList=http://localhost:8444

ENV HEALTHY_RESPONSE_CONTAINS='{"status":"UP"}'
