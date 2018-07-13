FROM cidasdpdasartip.cr.usgs.gov:8447/wma/wma-spring-boot-base:0.0.1

ENV repo_name=aqcu-maven-centralized
ENV artifact_id=aqcu-gateway
ENV artifact_version=0.0.5-SNAPSHOT
RUN ./pull-from-artifactory.sh ${repo_name} gov.usgs.aqcu ${artifact_id} ${artifact_version} app.jar

ADD launch-app.sh launch-app.sh
RUN ["chmod", "+x", "launch-app.sh"]

#Default ENV Values
ENV serverPort=443
ENV legacyServerList=http://localhost:8443
ENV tssReportServerList=http://localhost:8444
ENV dvhydroReportServerList=http://localhost:8444
ENV ribbonMaxAutoRetries=0
ENV ribbonConnectTimeout=6000
ENV ribbonReadTimeout=60000
ENV hystrixThreadTimeout=10000000
ENV oauthClientId=client-id
ENV oauthClientAccessTokenUri=https://example.gov/oauth/token
ENV oauthClientAuthorizationUri=https://example.gov/oauth/authorize
ENV oauthResourceTokenKeyUri=https://example.gov/oauth/token_key
ENV oauthResourceId=resource-id
ENV aqcuLoginUrl=https://localhost:443/

ENV OAUTH_CLIENT_SECRET_PATH=/oauthClientSecret.txt

ENV HEALTHY_RESPONSE_CONTAINS='{"status":"UP"}'
