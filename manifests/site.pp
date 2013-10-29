node default {
	package { [ 'httpd', 'php', 'mysql', 'mysql-server', 'php-mysql' ] : 
		ensure => installed,
	}

	service { [ 'httpd', 'mysqld' ] :
		ensure => running,
	}
}
