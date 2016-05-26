class nginx::params($root)
{

case $::osfamily {
'redhat','debian' : { 

$package = 'nginx' 
$owner = 'root'
$group = 'root' 
$docroot = $root 
$confdir = '/etc/nginx' 
$logdir = '/var/log/nginx'

}


default : {
fail("Module ${module_name} is not supported on ${::osfamily}") }

}

# user the service will run as. Used in the nginx.conf.erb template
$user = $::osfamily ? { 
'redhat' => 'nginx', 
'debian' => 'www-data', 
}

#

}
