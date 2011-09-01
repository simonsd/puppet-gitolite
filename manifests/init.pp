import 'classes/*'

class gitolite (
	$root = '/var/lib/gitolite/',
	$user = 'gitolite',
	$group = 'gitolite'
) {
	class {
		'gitolite::packages':
			before => Class['gitolite::core'];
		'gitolite::core':
			before => Class['gitolite::config'];
		'gitolite::config':;
	}

	Exec {
		path => '/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin'
	}
}
