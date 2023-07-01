# Use uma imagem base do PHP
FROM php:8.2.7

# Instale as dependências do PHP que você precisa
# Por exemplo, para instalar extensões do PHP, você pode usar o comando RUN e apt-get
RUN apt-get update && apt-get install -y \
    libzip-dev \
    zip \
    && docker-php-ext-install zip

# Defina o diretório de trabalho para o aplicativo
WORKDIR /var/www/html

# Copie os arquivos do seu aplicativo para o contêiner
COPY . /var/www/html

# Configure as permissões necessárias
RUN chown -R www-data:www-data /var/www/html

# Configure o PHP para ser executado com o servidor web
CMD php -S 0.0.0.0:8000 -t /var/www/html