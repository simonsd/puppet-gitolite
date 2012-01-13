class gitolite::setup {
# the su ${gitolite::user} stuff is dirty, but it works.
# don't try to replace it with user => "${gitolite::user}"; because that breaks.
# for some reason i think it's not properly su-ing to the gitolite user.

  exec {
    'gl-setup':
      command => "su ${gitolite::user} -c \"gl-setup -q ${gitolite::admin_pubkey}\"",
      onlyif  => "test -f ${gitolite::admin_pubkey}",
      unless  => "test -f ${gitolite::home}/.gitolite/conf/gitolite.conf";
  }
}
