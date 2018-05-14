class profile::apache(
  Boolean $default_vhost = false,
  Hash $apache_vhost_servers,
) {
  class { '::apache': 
    default_vhost => $default_vhost,    
  }
  
  create_resources(::apache::vhost, $apache_vhost_servers)


#  $docroot = "/var/www/${facts['fqdn']}"



#  ::apache::vhost { $facts['fqdn'] :
#    port    => 80,
#    docroot => $docroot,
#    before  => File["${docroot}/index.html"],
#  }

  file { "${docroot}/index.html":
    content => "Test page.  This is a test!!",
  }
}
