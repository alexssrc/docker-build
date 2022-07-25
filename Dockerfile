FROM --platform=linux/amd64 openjdk:8-jre-slim

MAINTAINER ssrc

EXPOSE 8080

ADD dist/app.jar /app.jar

ENTRYPOINT ["java","-jar","/app.jar"]