class gitolite::user {
	user {
		"$gitolite::user":
			ensure => present,
			gid => "$gitolite::group",
			home => "$gitolite::root",
			managehome => true,
			require => Group["$gitolite::group"];
	}

	group {
		"$gitolite::group":
			ensure => present;
	}
}
