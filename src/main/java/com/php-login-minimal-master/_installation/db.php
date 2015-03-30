<?php

/**
 * Configuration for: Database Connection
 *
 * For more information about constants please @see http://php.net/manual/en/function.define.php
 * If you want to know why we use "define" instead of "const" @see http://stackoverflow.com/q/2447791/1114320
 *
 * DB_HOST: database host, usually it's "127.0.0.1" or "localhost", some servers also need port info
 * DB_NAME: name of the database. please note: database and database table are not the same thing
 * DB_USER: user for your database. the user needs to have rights for SELECT, UPDATE, DELETE and INSERT.
 * DB_PASS: the password of the above user
 */
$DB_HOST = getenv('OPENSHIFT_MYSQL_DB_HOST');
$DB_USER = getenv('OPENSHIFT_MYSQL_DB_USERNAME');
$DB_PASS = getenv('OPENSHIFT_MYSQL_DB_PASSWORD');

define("DB_HOST", $DB_HOST);
define("DB_NAME", "java");
define("DB_USER", $DB_USER);
define("DB_PASS", $DB_PASS);