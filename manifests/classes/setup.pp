class gitolite::setup {
	file {
		'admin_sshkey':
			path => "$gitolite::root/.ssh/admin.pub",
			owner => "$gitolite::user",
			group => "$gitolite::user",
			content => "$gitolite::sshkey";
	}

#	for some wacky reason this doesn't work when running with puppet,
#	even though it does manually. running as root solves it.

	exec {
		'gl-setup':
			command => "gl-setup -q .ssh/admin.pub",
#			user => "$gitolite::user",
			cwd => "$gitolite::root",
			require => File['admin_sshkey'];
	}
}
