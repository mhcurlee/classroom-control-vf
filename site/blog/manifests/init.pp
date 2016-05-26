class blog {

# install needed pacakges

$packages = ["httpd", "php", "mariadb", "mariadb-server", "php-mysql"]

package {$packages:
  ensure  => present;
  }
  
  
service {"httpd":
  ensure => running,
  enable => true,
  }
  
service {"mariadb":
  ensure  => running,
  enable  => true,
  }
  


file {'/var/www/html/index.php':
  ensure  => file,
  source  => "puppet:///modules/blog/index.php",
  owner   => '0',
  group   => '0',
  }

  
}
  

  
