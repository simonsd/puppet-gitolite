class gitolite::repos {
  realize(Yumrepo['epel'], File['epel-gpg-key'])
}
