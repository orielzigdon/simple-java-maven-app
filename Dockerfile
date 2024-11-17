# Stage 1: Build
FROM maven:3.9.5-openjdk-17 as builder
WORKDIR /app
COPY . .
RUN mvn clean package

# Stage 2: Runtime
FROM openjdk:17-jre-slim
WORKDIR /app
COPY --from=builder /app/target/*.jar app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]
