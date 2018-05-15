class profile::nginx(
  Array $vhosts,
) {
  include ::nginx

  $vhosts.each |$vhosts| {
    ::nginx::vhost { $facts['fqdn']:
      port           => $vhosts['port'],
      server_aliases => $vhosts['server_aliases'],
    }
  }
}
