# Etapa 1: Build com Maven
FROM maven:3.9.6-eclipse-temurin-17 AS builder

WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# Etapa 2: Imagem final com JRE
FROM eclipse-temurin:17-jre

WORKDIR /app
COPY --from=builder /app/customer/target/*.jar app.jar

ENTRYPOINT ["java", "-jar", "app.jar"]