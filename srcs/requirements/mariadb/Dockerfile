FROM alpine:3.19

ARG DB_NAME DB_USER DB_PASS DB_ROOT

RUN apk update && apk add --no-cache envsubst mariadb mariadb-client

RUN mkdir /var/run/mysqld; \
    chmod 777 /var/run/mysqld; \
    { echo '[mysqld]'; \
      echo 'skip-host-cache'; \
      echo 'skip-name-resolve'; \
      echo 'bind-address=0.0.0.0'; \
    } | tee  /etc/my.cnf.d/docker.cnf; \
    sed -i "s|skip-networking|skip-networking=0|g" \
      /etc/my.cnf.d/mariadb-server.cnf

RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql

EXPOSE 3306
COPY requirements/mariadb/conf/ .
RUN ./create_db.sh && rm create_db.sh setup.sql
USER mysql
CMD ["/usr/bin/mysqld"]
