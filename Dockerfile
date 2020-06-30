# the first stage of our build will use a maven 3.6.1 parent image
FROM maven:3.6.1-jdk-8-alpine AS MAVEN_BUILD
 
# copy the pom and src code to the container
COPY ./ ./
 
# package our application code
RUN mvn clean package

FROM tomcat:8

COPY --from=MAVEN_BUILD target/*.war /usr/local/tomcat/webapps/