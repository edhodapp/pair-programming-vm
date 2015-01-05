include stdlib

include stmux
include python
include testproj
include ed_user

python::pip { 'virtualenvwrapper':
  ensure => latest,
}
package { 'vim':
  ensure => present,
  name   => 'vim-nox',
}
