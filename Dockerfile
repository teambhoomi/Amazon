FROM ubuntu:20.04
RUN apt-get update
RUN apt-get install -y openjdk-17-jdk
RUN mkdir tomcat
RUN apt-get install -y wget
RUN wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.88/bin/apache-tomcat-9.0.88.tar.gz 
RUN tar -xvf apache-tomcat-9.0.88.tar.gz
RUN cd  /apache-tomcat-9.0.88/webapps
COPY ./Amazon.war  /apache-tomcat-9.0.88/webapps
WORKDIR /apache-tomcat-9.0.88/
CMD sh bin/catalina.sh run
EXPOSE 8080
