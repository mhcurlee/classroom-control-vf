class  skeleton {

file {"/etc/skel":
  ensure => directory,
  owner   => '0',
  group   => '0',
  }
  
  
file {"etc/skel/.bashrc":
  ensure => file,
  source => 'puppet:///modules/skeleton/bashrc',
  owner  => '0',
  group  =>  '0',
  require =>  File['/etc/skel'],
}



}
