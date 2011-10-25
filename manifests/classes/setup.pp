class gitolite::setup {
	file {
		'admin_sshkey':
			path => "$gitolite::root/.ssh/admin.pub",
			owner => "$gitolite::user",
			group => "$gitolite::user",
			content => "$gitolite::sshkey";
	}

	exec {
		'gl-setup':
			command => "gl-setup $gitolite::root/.ssh/admin.pub",
			user => "$gitolite::user",
			cwd => "$gitolite::root",
			require => File['admin_sshkey'];
	}
}
