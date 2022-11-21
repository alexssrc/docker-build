FROM --platform=linux/arm64 openjdk:17-jdk-slim

MAINTAINER Alexpy

EXPOSE 8080

ADD ../dist/app.jar /app.jar

ENTRYPOINT ["java","-jar","/app.jar","--server.port=8080"]