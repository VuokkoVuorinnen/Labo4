node default {
	package { [ 'httpd', 'php' ] : 
		ensure => installed,
	}

	service { 'httpd':
		ensure => running,
	}
}