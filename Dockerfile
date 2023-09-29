#
# Build stage
#
FROM maven:3.8.2-jdk-11 AS build
COPY . .
RUN mvn clean package -DskipTests




FROM openjdk:11
COPY --from=build /target/deploy-0.0.1-SNAPSHOT.jar deploy.jar
# ENV PORT=8080
EXPOSE 8082
ENTRYPOINT ["java","-jar","deploy.jar"]

#ENTRYPOINT ["java", "-Djava.security.egd=file:/dev/./urandom","-DskipTests","-jar","/app.jar"]
#ENTRYPOINT ["java", "-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar","--spring.profiles.active={PROFILES_ACTIVE}"]
#ENTRYPOINT ["java", "-Xmx256m", "-Xss32m","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]