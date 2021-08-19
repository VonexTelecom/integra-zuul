FROM openjdk:8-jdk-alpine

ENV TZ='GMT-3'

VOLUME /tmp

EXPOSE 8081

ARG JAR_FILE=target/*.jar

ADD ${JAR_FILE} api-zuul.jar

ENTRYPOINT ["java","-Xmx1g","-jar","/api-zuul.jar"]
