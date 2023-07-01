# db.dockerfile

FROM mysql:latest

# Configuração do banco de dados
ENV MYSQL_ROOT_PASSWORD=root
ENV MYSQL_DATABASE=localhost
ENV MYSQL_PASSWORD=root

# Copia o script SQL para ser executado na inicialização
COPY db.sql /docker-entrypoint-initdb.d/
RUN echo "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;" > /docker-entrypoint-initdb.d/grant.sql
