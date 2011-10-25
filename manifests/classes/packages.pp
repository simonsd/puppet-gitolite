class gitolite::packages {
	@package {
		'gitolite':
			ensure => present,
			require => $::operatingsystem ? {
				default => undef,
				centos => Yumrepo['epel'],
			},
	}

	@yaourt::pkg {
		'gitolite':
			name => 'gitolite-git';
	}

	if $::operatingsystem == 'archlinux' {
		realize(Yaourt::Pkg['gitolite'])
	} else {
		realize(Package['gitolite'])
	}
}
