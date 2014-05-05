node default {

  class {
    'mysql::server':;
    'mysql::bindings':php_enable => true;
    'apache':default_ssl_vhost   => true;
    'apache::mod::ssl':;
    'apache::mod::php':;
  }

  file { 'wordpress.sql':
    ensure  => file,
    path    => '/home/vagrant/files/wordpress.sql',
  }

  mysql::db { 'wordpress':
    user        => 'vagrant',
    password    => 'vagrant',
    host        => 'localhost',
    grant       => ['ALL'],
    sql         => '/home/vagrant/files/wordpress.sql',
    enforce_sql => true,
    require     => File['wordpress.sql'],
  }

  exec { 'Bats testing':
    require   => Service['httpd'],
    command   => 'bats /home/vagrant/tests/lamp.bats',
    path      => '/usr/local/bin:/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/sbin:/home/vagrant/bin',
    logoutput => true,
  }

  file {'/etc/pki/tls/certs/localhost.crt':
    source    => '/home/vagrant/files/localhost.crt',
    mode      => '0600',
    owner     => 'root',
    group     => 'root',
  }

  file {'/etc/pki/tls/private/localhost.key':
    source    => '/home/vagrant/files/localhost.key',
    mode      => '0600',
    owner     => 'root',
    group     => 'root',
  }
}
