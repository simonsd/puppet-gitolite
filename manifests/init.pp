import 'classes/*'

class gitolite (
	$root = '/var/lib/gitolite',
	$user = 'gitolite',
	$group = 'gitolite',
	$confdir = '/etc/gitolite',
	$confrepo = "$gitolite::repo_root/gitolite-admin.git",
	$sshkey = 'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAqG2peGlJK7ca53uOQ8GDW4TPlsS1H13rdGU6Paz675QSLrZMfUSb1G3BQ8fn0kQ3kYaKiYZ9H7Kb+UUuep6dRB1LnaknNCQ6bVm0YcPbhY1g95L7WjMxBNWGNDPKhyt0ArWXasHQOHmDZQIyPUWJpRMw9r9Ovq5zBho71ESW2UeER5dKSozdlDIRF1KpmgQwniPRev584p3HhRrJfq/s41aYVo+TqtGHVMsPt5R47E67QgWGC5sZmTRUFDDLALxDXRC+OmyWN4ipsy56VEX5zcmCkBWqhonsuqbm9LBKXUGNhiwVL54HlypOh8enASsY6v/8FG+hKCX5Vpty+DvFQw== gitolite@test'
) {
	class {
		'gitolite::packages':
			before => Class['gitolite::user'];
		'gitolite::user':
			before => Class['gitolite::config'];
		'gitolite::config':
			before => Class['gitolite::setup'];
		'gitolite::setup':;
	}

	Exec {
		path => '/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin'
	}
}
