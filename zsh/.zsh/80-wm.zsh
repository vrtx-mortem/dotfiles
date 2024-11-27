if [[ "$HOSTNAME" == "vortex" ]]; then
  [[ "$TTY" == "/dev/tty1" ]] && startx
  [[ "$TTY" == "/dev/tty2" ]] && ~/src/dwl/dwl
fi
