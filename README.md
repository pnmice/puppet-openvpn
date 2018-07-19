# puppet-openvpn

## Overview

Puppet module to manage OpenVPN links. It supports Red Hat Enterprise Linux
(RHEL) or any of its clones, as well as Gentoo Linux, and should be easy to
modify to support more distributions.

* `openvpn` : Main class to install, enable and configure the service.
* `openvpn::conftemplate` : Same as conf, but based on an included template.

Disable selinux
* puppet module install puppet-selinux

```puppet
class { selinux:
  mode => 'disabled',
}
```

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
  ca           => '/etc/openvpn/client01/keys/ca.crt',
  cert         => '/etc/openvpn/client01/keys/client.crt',
  key          => '/etc/openvpn/client01/keys/client.key',
  tls_auth     => '/etc/openvpn/client01/keys/ta.key 1',
}
```
