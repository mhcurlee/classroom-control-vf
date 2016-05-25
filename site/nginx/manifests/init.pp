class nginx {




File {
  owner  => '0',
  group  => '0',
  mode   => '0644',
}



package {'nginx': 
  ensure   => present,
}


file {'/var/www':
  ensure   =>  directory,
  mode     =>  '0755',
}  

file {'/var/www/index.html':
  ensure   =>  present,
  source   => 'puppet:///modules/nginx/index.html',
  require  => Package['nginx'],
}  


file {'/etc/nginx/nginx.conf':
  ensure   => 'present',
  source   => 'puppet:///modules/nginx/nginx.conf',
  require  => Package['nginx'],
  
  }

file {'/etc/nginx/conf.d/default.conf':
   ensure    => 'present',
   source    => 'puppet:///modules/nginx/default.conf',
   require  => Package['nginx'],
   }




service {'nginx':
   ensure  => 'running',
   enable  => 'true',
   subscribe => [ File['/etc/nginx/conf.d/default.conf'], File['/etc/nginx/nginx.conf'] ],
}
  
  




}
