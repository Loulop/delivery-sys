.PHONY: help

MYSQL_DB_NAME := "delivery_sys"

help:
	@echo "TODO: description"

mysql.bootstrap.mac:
	@brew install mysql;
	@brew services restart mysql;
	@pip3 install sqlfluff;

mysql.create:
	@mysql -h localhost -u root --execute="CREATE DATABASE IF NOT EXISTS $(MYSQL_DB_NAME);";

mysql.delete:
	@mysql -h localhost -u root --execute="CREATE DATABASE IF NOT EXISTS $(MYSQL_DB_NAME);";

mysql.init: mysql.delete mysql.create
	@cat ./db_schemas/*.sql | mysql -h localhost -u root $(MYSQL_DB_NAME);

mysql.lint:
	@sqlfluff lint --exclude-rules L039,L016,L029,L003;