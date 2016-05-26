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
  
  

  
}
  

  
