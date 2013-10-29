node default {
	
	package { [ 'httpd', 'php', 'mysql', 'mysql-server', 'php-mysql' ] : 
		ensure => installed,
		before => Service['httpd', 'mysqld']
	}

	service { [ 'httpd', 'mysqld' ] :
		ensure => running,
	}
}
