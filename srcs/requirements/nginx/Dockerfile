FROM alpine:3.19

ARG DOMAIN_NAME CERT CERT_KEY

RUN apk update && apk upgrade && apk add --no-cache envsubst nginx

WORKDIR /etc/nginx
COPY conf/ http.d/
RUN envsubst '${DOMAIN_NAME} ${CERT} ${CERT_KEY}' < http.d/nginx.conf > http.d/nginx.tmp \
	&& mv http.d/nginx.tmp http.d/nginx.conf

EXPOSE 443
CMD ["nginx", "-g", "daemon off;"]
