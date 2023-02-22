FROM maven:3.6.3-jdk-8
WORKDIR /app
COPY . /app
RUN mvn package
FROM tomcat:8.0.20-jre8
COPY --from=0 /app/target/hello-1.0.war /usr/local/tomcat/webapps/
EXPOSE 8080
CMD ["catalina.sh", "run"]
