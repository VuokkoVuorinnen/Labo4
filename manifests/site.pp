node default {
	include '::mysql::server'	
	class { 'apache':  }
	class { 'apache::mod::php': }

	mysql::db { 'wordpress':
      	user     => 'vagrant',
        password => 'vagrant',
        host     => 'localhost',
        grant    => ['ALL'],
    }

}