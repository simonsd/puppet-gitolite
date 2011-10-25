class gitolite::config {
	file {
		"$gitolite::root":
			ensure => directory,
			owner => "$gitolite::user",
			group => "$gitolite::group",
			mode => "0700",
			require => User["$gitolite::user"];

		"$gitolite::root/.ssh":
			ensure => directory,
			owner => "$gitolite::user",
			group => "$gitolite::group",
			mode => "0700",
			require => File["$gitolite::root"];

		"$gitolite::confdir":
			ensure => directory,
			owner => "$gitolite::user",
			group => "$gitolite::group",
			mode => "0750";

		'gitolite.rc':
			ensure => present,
			path => "$gitolite::confdir/gitolite.rc",
			owner => "$gitolite::user",
			group => "$gitolite::group",
			mode => '0644',
			content => template('gitolite/gitolite.rc.erb'),
			require => File["$gitolite::confdir"];

		'gitolite.conf':
			ensure => present,
			path => "$gitolite::confdir/gitolite.conf",
			owner => "$gitolite::user",
			group => "$gitolite::group",
			mode => '0600',
			content => template('gitolite/gitolite.conf.erb'),
			require => File["$gitolite::confdir"];
	}
}
