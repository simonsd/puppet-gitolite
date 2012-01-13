class gitolite::packages {
  if $::operatingsystem == 'archlinux' {
    yaourt::pkg {
      'gitolite':
        name => 'gitolite-git';
    }
  } else {
    package {
      'gitolite':
        ensure  => present,
        require => $::operatingsystem ? {
          default => undef,
          centos  => Yumrepo['epel'],
        },
    }
  }
}
