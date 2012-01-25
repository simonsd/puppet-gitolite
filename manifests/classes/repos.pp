class gitolite::repos {
  if $::operatingsystem == 'centos' {
    realize(Yumrepo['epel'], File['epel-gpg-key'])
  }
}
