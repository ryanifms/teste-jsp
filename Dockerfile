# Usa a imagem oficial do Maven para construir o projeto
FROM maven:3.9.5-eclipse-temurin-17 AS build
WORKDIR /app

# Copia o código fonte para dentro do container
COPY . .

# Executa o Maven para construir o WAR
RUN mvn clean package -DskipTests

# Usa a imagem oficial do Tomcat para rodar a aplicação
FROM tomcat:9.0-jdk17

# Copia o WAR gerado para o Tomcat
COPY --from=build /app/target/*.war /usr/local/tomcat/webapps/ROOT.war

# Expõe a porta 8080
EXPOSE 8080

# Inicia o Tomcat
CMD ["catalina.sh", "run"]
