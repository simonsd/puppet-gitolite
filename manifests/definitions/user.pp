define gitolite::user (
	$name,
	$key,
	$keytype = 'rsa',
	$host
) {
	file {
		"$name.pub":
			ensure => present,
			path => "$gitolite::root/.gitolite/keydir/$name.pub",
			owner => "$gitolite::user",
			group => "$gitolite::group",
			mode => "0644",
			content => template('gitolite/ssh.pub.erb');
	}
}
