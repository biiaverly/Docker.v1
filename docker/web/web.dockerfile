# Use uma imagem base do Nginx
FROM nginx:latest

# Copie o arquivo de configuração do Nginx para o contêiner
COPY nginx.conf /etc/nginx/nginx.conf

# Exponha a porta 80 para permitir o acesso HTTP ao contêiner
EXPOSE 80