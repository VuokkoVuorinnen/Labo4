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

	mysql::db { 'wordpress':
		user     => 'vagrant',
		password => 'vagrant',
		host     => 'localhost',
		grant    => ['ALL'],
	}

}
