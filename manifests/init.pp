import 'classes/*'

class gitolite (
	$user = 'gitolite',
	$group = 'gitolite',
	$admin_pubkey
) {
	class {
		'gitolite::packages':
			before => Class['gitolite::user'];
		'gitolite::user':
			before => Class['gitolite::setup'];
		'gitolite::setup':;
	}

	Exec {
		path => '/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin'
	}
}
