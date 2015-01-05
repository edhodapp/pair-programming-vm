class stmux {
  package { 'tmux':
    ensure => present,
    name   => 'tmux',
  }
  group { 'stmux_group':
    ensure => present,
    name   => 'stmux',
  }
  file { 'stmux_script':
    ensure => present,
    path   => '/usr/local/bin/stmux.sh',
    source => 'puppet:///modules/stmux/stmux.sh',
    owner  => 'root',
    group  => 'root',
  }
  file { 'stmux_conf_dir':
    ensure => directory,
    path   => '/etc/stmux',
    owner  => 'root',
    group  => 'root',
  }
  file { 'stmux_conf':
    ensure  => present,
    require => File['stmux_conf_dir'],
    path    => '/etc/stmux/stmux.conf',
    source  => 'puppet:///modules/stmux/stmux.conf',
    owner   => 'root',
    group   => 'root',
  }
  file { 'stmux_sockets':
    ensure => directory,
    path   => '/var/stmux',
    owner  => 'root',
    group  => 'stmux',
    mode   => 2775,
  }
}
