FROM ubuntu:20.04

MAINTAINER Hitesh

RUN apt-get update && apt-get install -y openjdk-11-jdk wget

RUN wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.83/bin/apache-tomcat-9.0.83.tar.gz
RUN tar -xf apache-tomcat-9.0.83.tar.gz
RUN mkdir /tomcat
RUN mv apache-tomcat-9.0.83 /tomcat/

WORKDIR /tomcat

COPY my-app-2.0-SNAPSHOT.jar webapps/

EXPOSE 8085

CMD ["apache-tomcat-9.0.83/bin/catalina.sh", "run"]
