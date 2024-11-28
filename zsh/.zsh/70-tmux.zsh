[[ $EUID -eq 0 ]] && return
[[ ! -z $TMUX ]] && return
[[ "$TTY" != *"pts"* ]] && return

[[ "$HOSTNAME" == "vortex"         ]] && DEFAULT="work"
[[ "$HOSTNAME" == "katar"          ]] && DEFAULT="rnd"
[[ "$HOSTNAME" == "lolwut"         ]] && DEFAULT="dev"
[[ "$HOSTNAME" == "pentest-monkey" ]] && DEFAULT="work"


tmux has-session -t "work" 2>/dev/null || tmux new-session -d -s work -c "${HOME}/projects/current"
tmux has-session -t "dev" 2>/dev/null  || tmux new-session -d -s dev  -c "${HOME}/src"
tmux has-session -t "rnd" 2>/dev/null  || tmux new-session -d -s rnd  -c "${HOME}"
tmux has-session -t "fun" 2>/dev/null  || tmux new-session -d -s fun  -c "${HOME}"

if [[ \
  "$HOSTNAME" == "vortex" || \
  "$HOSTNAME" == "pentest-monkey" \
]]; then
  tmux attach -t "$DEFAULT"
fi
