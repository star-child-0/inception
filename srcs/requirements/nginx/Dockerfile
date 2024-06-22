FROM alpine:3.19
RUN apk update && apk upgrade && apk add --no-cache nginx
COPY conf/nginx.conf /etc/nginx/nginx.conf

EXPOSE 443
CMD ["nginx", "-g", "daemon off;"]
