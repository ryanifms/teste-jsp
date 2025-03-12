# Usa a imagem oficial do Tomcat 9 com JDK 17
FROM tomcat:9.0-jdk17

# Define o diretório de trabalho
WORKDIR /usr/local/tomcat/webapps/

# Copia o arquivo .war para a pasta de deploy do Tomcat
COPY target/seu-app.war /usr/local/tomcat/webapps/

# Expõe a porta 8080 (padrão do Tomcat)
EXPOSE 8080

# Inicia o Tomcat
CMD ["catalina.sh", "run"]
 
