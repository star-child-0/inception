FROM alpine:3.19
RUN apk update && apk upgrade && apk add --no-cache nginx
COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY tools/* /etc/nginx/ssl/

EXPOSE 443
CMD ["nginx", "-g", "daemon off;"]
