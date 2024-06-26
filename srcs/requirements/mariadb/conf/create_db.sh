#!bin/sh

if [ ! -d "/var/lib/mysql/mysql" ]; then
	chown -R mysql:mysql /var/lib/mysql

	# init database
	mysql_install_db --basedir=/usr --datadir=/var/lib/mysql --user=mysql --rpm

	tfile=`mktemp`
	if [ ! -f "$tfile" ]; then
		return 1
	fi
fi

if [ ! -d "/var/lib/mysql/$DB_NAME" ]; then
	envsubst < setup.sql
	/usr/bin/mysqld --user=mysql --bootstrap < setup.sql
fi
