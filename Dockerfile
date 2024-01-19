# Stage 1: Build the application
FROM maven:3.8.4-openjdk-11 AS builder

WORKDIR /app

COPY . .

RUN mvn clean install

# Stage 2: Run the application
FROM openjdk:11-jre-slim

WORKDIR /app

COPY --from=builder /app/target/demo-0.0.1-SNAPSHOT.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "/app/app.jar"]