define gitolite::repo (
	$name,
	$owner = "$gitolite::user",
	$group = "$gitolite::group",
) {
	file {
		"$name.conf":
			ensure => present,
			path => "$gitolite::root/.gitolite/conf/repos/$name.conf",
			$owner => "$gitolite::user",
			$group => "$gitolite::group",
			content => template('gitolite/repo.conf');
	}
}
