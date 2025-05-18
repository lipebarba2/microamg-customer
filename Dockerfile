# Estagio 1: Build do projeto Maven
FROM maven:3.8.1-openjdk-17 AS builder
WORKDIR /app
ARG MODULE
# Copia o diretorio do modulo especifico (customer ou fraud) para dentro do conteiner
COPY ${MODULE} /app/${MODULE}
# Copia o pom.xml pai (assumindo que esta na raiz do contexto de build)
COPY pom.xml /app/

# Navega para o diretorio do modulo dentro do conteiner para rodar o Maven
WORKDIR /app/${MODULE}

# Roda o build Maven para o modulo
# Usa -f para especificar o pom.xml do modulo
RUN mvn clean package -DskipTests

# --- Segundo estagio: Imagem final ---
FROM openjdk:17-jdk-slim
WORKDIR /app
# Declare ARG MODULE novamente no segundo estagio para garantir que esteja disponivel
ARG MODULE

# Copia o JAR gerado pelo Maven do primeiro estagio
# O JAR estara em /app/${MODULE}/target/ no estagio 'builder'
COPY --from=builder /app/${MODULE}/target/*.jar app.jar

# Define o ponto de entrada do conteiner
ENTRYPOINT ["java","-jar","/app/app.jar"]
