node default {	
	
	class { 'mysql::server': }
	
	class { 'mysql::bindings':
		php_enable	=> true,
		}

	class { 'apache': 
		default_ssl_vhost	=> true,
		}
	
	class { 'apache::mod::ssl': }
	
	class { 'apache::mod::php': }

	file {
		"Make sure the wordpress.sql file exists":
		ensure => file,
		path   => '/var/www/html/wordpress.sql',
  	}->

	mysql::db { 'wordpress':
		user		=> 'vagrant',
		password	=> 'vagrant',
		host		=> 'localhost',
		grant		=> ['ALL'],
		sql 		=> '/var/www/html/wordpress.sql',
		enforce_sql => true,
	}

}
