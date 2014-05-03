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
    path    => '/var/www/html/wordpress.sql',
  }

  mysql::db { 'wordpress':
    user        => 'vagrant',
    password    => 'vagrant',
    host        => 'localhost',
    grant       => ['ALL'],
    sql         => '/var/www/html/wordpress.sql',
    enforce_sql => true,
    require     => File['wordpress.sql'],
  }

  exec { 'Bats testing':
    require   => Service['httpd'],
    command   => 'bats /home/vagrant/tests/lamp.bats',
    path      => '/usr/local/bin:/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/sbin:/home/vagrant/bin',
    logoutput => true,
  }

}
