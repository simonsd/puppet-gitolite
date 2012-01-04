class gitolite::user {
	user {
		"$gitolite::user":
			ensure => present,
			gid => "$gitolite::group",
			require => Group["$gitolite::group"];
	}

	group {
		"$gitolite::group":
			ensure => present;
	}
}
