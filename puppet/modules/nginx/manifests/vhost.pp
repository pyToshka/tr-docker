define nginx::vhost (
  $host = undef,
  $root = undef,

){
  if $service_id == ''{
    $service_id = 'localhost'
  }
if $root == ''{
    fail("root path not set")
  }

  file {
    "vhost_${fqdn}":
      path    => "/etc/nginx/sites-enabled/${fqdn}",
      content => template("nginx/nginx_vhost.erb"),
      mode    => '0644',
      require => Package['nginx'];

  }
}