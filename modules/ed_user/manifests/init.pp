class ed_user {
  user { 'ed':
    ensure     => present,
    comment    => 'Ed Hodapp',
    home       => '/home/ed',
    managehome => true,
    groups     => [ 'stmux', 'testproj', ],
    shell      => '/bin/bash',
  }
  ssh_authorized_key { 'ed_ssh':
    user => 'ed',
    type => 'rsa',
    key  =>
    'AAAAB3NzaC1yc2EAAAADAQABAAABAQDarGoqrFY+tbjg3eszEtwxwWc0rrS17RyqeIZ4xFrHf395frUAqykZOh5jZNpz8ySTbNYykzGvISX0sCsy2IR8JSnLhvb5dR526nDiXGXKXO8antTmvkTgSOBbYFhXApP75Be9MS8vWnkhh803L4RGgOYeyPNXBJhzeaYjWp7vs2QubUVU6j6pPMWX23joRghqhUFtXAD32++DAyvyNTBz3RrMfX8jUi7JwBDW2fblnS4RFhG1Vk+x3JAK0h9WSHBLYuPmD3OPbUU5t6I+jx05bkgxxJQyEyJaEkG41A0uVLf2F93NyTFNxYgAWIIosqGFY4Crac1jiQYpMMUTSz5D',
  }
  file_line { 'ed_sudo':
    path => '/etc/sudoers',
    line => 'ed ALL=(ALL) NOPASSWD: ALL',
  }
  file_line { 'ed_stmux':
    path    => '/home/ed/.bashrc',
    line    => 'source /usr/local/bin/stmux.sh',
    require => User['ed'],
  }
  file_line { 'ed_venvwrapper':
    path    => '/home/ed/.bashrc',
    line    => 'source /usr/local/bin/virtualenvwrapper.sh',
    require => Class['python']
}
