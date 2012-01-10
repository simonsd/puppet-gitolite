class gitolite::setup {
#	for some wacky reason this doesn't work when running with puppet,
#	even though it does manually. running as root solves it.

	exec {
		'gl-setup':
			command => "gl-setup -q ${gitolite::admin_pubkey}",
			onlyif => "test -f ${gitolite::admin_pubkey}";
#			user => "$gitolite::user";
	}
}
