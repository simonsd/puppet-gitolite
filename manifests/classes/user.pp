class gitolite::user {
	user {
		"$gitolite::user":
			ensure => present,
			gid => "$gitolite::group",
			managehome => true,
			home => "${gitolite::home}",
			require => Group["$gitolite::group"];
	}

	group {
		"$gitolite::group":
			ensure => present;
	}
}
