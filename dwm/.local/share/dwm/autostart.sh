hsetroot -full "${HOME}/pictures/wallpaper.png"
autocutsel -fork
autocutsel -selection PRIMARY -fork
picom 2>&1 >/dev/null &
$HOME/src/st/st
