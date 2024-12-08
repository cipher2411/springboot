#maven
FROM maven:3.8.5-openjdk-17 as build
COPY . .
RUN mvn clean package -DskipTests


#JDK
FROM openjdk:17.0.1-jdk-slim
WORKDIR /app
COPY --from=build /target/demo-0.0.1-SNAPSHOT.jar demo.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "demo.jar"]