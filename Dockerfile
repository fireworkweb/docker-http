FROM nginx:alpine

WORKDIR /app

COPY default.conf /etc/nginx/conf.d/default.conf

EXPOSE 80
