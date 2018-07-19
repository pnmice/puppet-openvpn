# puppet-openvpn

## Overview

Puppet module to manage OpenVPN links. It supports Red Hat Enterprise Linux
(RHEL) or any of its clones, as well as Gentoo Linux, and should be easy to
modify to support more distributions.

* `openvpn` : Main class to install, enable and configure the service.
* `openvpn::conf` : Definition to manage OpenVPN configuration files.
* `openvpn::conftemplate` : Same as conf, but based on an included template.
* `openvpn::secret` : Definition to manage OpenVPN secret key files.
* `openvpn::startup_script` : Class to configure an optional startup script.

## Examples

Basic OpenVPN setup :

```puppet
include '::openvpn'
openvpn::conftemplate { 'client01':
  mode         => 'client',
  dev          => 'tap0',
  proto        => 'udp',
  remote       => 'remote-server.example.com',
  local        => 'local-ip',
  port         => '2222',
  verb         => '4',
  resolv_retry => 'infinite',
  topology     => 'subnet',
  ca           => '/etc/openvpn/client/keys/ca.crt',
  cert         => '/etc/openvpn/client/keys/client.crt',
  key          => '/etc/openvpn/client/keys/client.key',
  tls_auth     => '/etc/openvpn/client/keys/ta.key 1',
}
```
