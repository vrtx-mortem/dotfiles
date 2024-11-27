function music-go {
  mpc --host=$HOME/.config/mpd/mpd.socket consume on
  mpc --host=$HOME/.config/mpd/mpd.socket volume 15
  mpc --host=$HOME/.config/mpd/mpd.socket add /
  mpc --host=$HOME/.config/mpd/mpd.socket play
}
