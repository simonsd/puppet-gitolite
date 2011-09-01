class gitolite::core {
	exec {
		'gl-setup':
			command => "gl-setup $sshkey",
			user => "$gitolite::user",
			cwd => "$gitolite::root";
	}
}
