class gitolite::core {
	file {
		'gl-sshkey':
			path => "$gitolite::root/.ssh/id_rsa.pub",
			owner => "$gitolite::user",
			group => "$gitolite::user",
	}

	exec {
		'gl-setup':
			command => "$gitolite::sshkey > gl-setup",
			user => "$gitolite::user",
			cwd => "$gitolite::root";
	}
}
