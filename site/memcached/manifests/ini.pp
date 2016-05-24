class memcached {


package {"memcached":
  ensure  =>  'present',
  }
  
file {"/etc/sysconfig/memcached":
  ensure    => 'present',
  source    => 'puppet///modules/memcached/memcached',
  owner     => '0',
  group     => '0',
  require   => Package['memcached'],
  }
  
  
  service {"memcached":
    ensure  => 'running',
    enable  => 'true',
    subscribe => File['/etc/sysconfig/memcached'],
    }
    
    
    
    
}
    
    
