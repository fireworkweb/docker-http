FROM nginx:alpine

ENV ASUSER 0

WORKDIR /app

RUN adduser -D -u 1337 fwd \
    && apk --no-cache add bash shadow su-exec \
    && sed -i "s/^user .*/user\ fwd;/g" /etc/nginx/nginx.conf

COPY default.conf /etc/nginx/conf.d/default.conf
COPY entrypoint /entrypoint
RUN chmod +x /entrypoint

EXPOSE 80

ENTRYPOINT [ "/entrypoint" ]
CMD ["nginx", "-g", "daemon off;"]
