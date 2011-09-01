import 'classes/*'

class gitolite (
	$root = '/var/lib/gitolite/',
	$user = 'gitolite',
	$group = 'gitolite'
) {
	class {
		'gitolite::packages':
			before => Class['gitolite::config'];
		'gitolite::config':;
	}
}
