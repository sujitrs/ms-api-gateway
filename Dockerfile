FROM openjdk:latest
VOLUME /tmp
VOLUME E:/_fsconfig/ /_fsconfig/
ARG DEPENDENCY=target/dependency
COPY ${DEPENDENCY}/BOOT-INF/lib /app/lib
COPY ${DEPENDENCY}/META-INF /app/META-INF
COPY ${DEPENDENCY}/BOOT-INF/classes /app
ENTRYPOINT ["java","-cp","app:app/lib/*"]
CMD ["-Dserver.port=9190 -Deureka.client.serviceUrl.defaultZone=http://localhost:8761/eureka/","org.sj.msapigateway.MsApiGatewayApplication"]
#docker run -p 9000:9191 ms-user-repo-docker:latest --entrypoint "java -cp app:app/lib/* -Deureka.client.register-with-eureka=true -Deureka.client.fetch-registry=true -Deureka.client.serviceUrl.defaultZone=http://localhost:8761/eureka  org.sj.msuserrepo.MsUserRepoApplication"
#-Dserver.port=9190 -Deureka.client.serviceUrl.defaultZone=http://localhost:8761/eureka/