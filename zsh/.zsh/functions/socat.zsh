function rev-shell {
  socat file:`tty`,echo=0,raw tcp4-listen:"$@",reuseaddr
}
