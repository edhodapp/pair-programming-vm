class testproj {
  group { 'testproj_group':
    ensure => present,
    name   => testproj,
  }
  file { 'testproj_home':
    ensure => directory,
    path   => '/home/testproj',
    owner  => root,
    group  => testproj,
    mode   => 2775,
  }
}
