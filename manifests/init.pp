import 'classes/*'

class gitolite (
	$user = 'gitolite',
	$group = 'gitolite',
	$home = '/var/lib/gitolite',
	$admin_pubkey
) {
	if ! defined(Class['::repos']) { include ::repos }

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
