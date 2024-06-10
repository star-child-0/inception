FROM debian:11
RUN apt-get update && apt-get upgrade && apt-get install -y nginx
COPY /conf/nginx.conf /etc/nginx/nginx.conf
EXPOSE 443
CMD ["nginx", "-g", "daemon off;"]
