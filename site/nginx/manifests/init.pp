class nginx {


package {'nginx': 
  ensure   => present,
}



file {'/var/www/index.html':
  ensure   =>  present,
  source   => 'puppet:///modules/nginx/index.html',
  owner    => 'nginx',
  group    => 'nginx',
}  


file {'/etc/nginx/nginx.conf':
  ensure   => 'present',
  source   => 'puppet:///modules/nginx/nginx.conf',
  owner    => '0',
  group    => '0',
  
  }

file {'/etc/nginx/conf.d/default.conf':
   ensure    => 'present',
   source    => 'puppet:///modules/nginx/default.conf',
   owner     => '0',
   group     => '0',
   }




service {'nginx':
   ensure  => 'running',
   enable  => 'true',
   subscribe => [ File['/etc/nginx/conf.d/default.conf'], File['/etc/nginx/nginx.conf'] ],
}
  
  




}
