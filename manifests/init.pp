import 'classes/*'

class gitolite (
	$root = '/var/lib/gitolite/',
	$user = 'git',
	$group = 'git'
) {
	class {
		'gitolite::packages':
			before => Class['gitolite::config'];
		'gitolite::config':;
	}
}
