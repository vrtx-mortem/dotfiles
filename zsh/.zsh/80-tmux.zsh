[[ $EUID -eq 0 ]] && return
[[ ! -z $TMUX ]] && return

[[ "$HOSTNAME" == "vortex"         ]] && DEFAULT="work"
[[ "$HOSTNAME" == "katar"          ]] && DEFAULT="rnd"
[[ "$HOSTNAME" == "lolwut"         ]] && DEFAULT="dev"
[[ "$HOSTNAME" == "pentest-monkey" ]] && DEFAULT="work"


TMUX_SESSIONS=$(tmux list-session -F '#S' 2>/dev/null)
[[ $TMUX_SESSIONS = *"work"* ]] || tmux new-session -d -s work -c "${HOME}/projects/current"
[[ $TMUX_SESSIONS = *"dev"*  ]] || tmux new-session -d -s dev  -c "${HOME}/src"
[[ $TMUX_SESSIONS = *"rnd"*  ]] || tmux new-session -d -s rnd  -c "${HOME}"
[[ $TMUX_SESSIONS = *"fun"*  ]] || tmux new-session -d -s fun  -c "${HOME}"
unset TMUX_SESSIONS

if [[ \
  "$HOSTNAME" == "vortex" || \
  "$HOSTNAME" == "pentest-monkey" \
]]; then
  tmux attach -t "$DEFAULT"
fi
