# Define: openvpn::conftemplate
#
# Wrapper around openvpn::conf which uses a template included in the module,
# useful for simple shared key VPN links.
#
define openvpn::conftemplate (
  $dev              = undef,
  $remote           = undef,
  $local            = undef,
  $proto            = undef,
  $fragment         = undef,
  $mssfix           = undef,
  $float            = undef,
  $topology         = undef,
  $resolv_retry     = undef,
  $routes           = [],
  $port             = undef,
  $user             = 'openvpn',
  $group            = 'openvpn',
  $verb             = undef,
  $dir              = '/etc/openvpn',
  $ca               = undef,
  $cert             = undef,
  $key              = undef,
  $mode             = undef,
  $tls_auth         = undef,
) {

  openvpn::conf { $title:
    dir     => $dir,
    content => template('openvpn/default.conf.erb'),
    # The secret file referenced, which already requires the parent dir
    #require => [ "File[${ca}]", "File[${cert}]", "File[${key}]" ]
  }

}

