class gitolite::packages {
	package {
		'gitolite':
			ensure => present,
			require => $::operatingsystem ? {
				default => undef,
				centos => Yumrepo['epel'],
			},
	}
}
