autoload -U colors compinit bashcompinit
colors
compinit
bashcompinit

autoload -z edit-command-line
zle -N edit-command-line

umask 077

function hg_branch_info() {
  local current_branch=$(hg branch 2>/dev/null)
  if [[ -n $current_branch ]]; then
    echo -n " %{$fg[green]%}${current_branch}%{$reset_color%}"
  fi
}

function git_branch_info() {
  local current_branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
  if [[ -n $current_branch ]]; then
    echo -n ": %{$fg[green]%}${current_branch}%{$reset_color%}"
  fi
}

function python_virtual_env() {
  if [[ ! -z $VIRTUAL_ENV ]]; then
    echo -n "  "
  fi
}

function precmd() {
  local helper="$PS1_SUFFIX"
  COLOUR="white"
  [[ "$HOSTNAME" == "vortex"         ]] && COLOUR="yellow"
  [[ "$HOSTNAME" == "katar"          ]] && COLOUR="green"
  [[ "$HOSTNAME" == "lolwut"         ]] && COLOUR="red"
  [[ "$HOSTNAME" == "pentest-monkey" ]] && COLOUR="magenta"

  BANG=""
  [[ $EUID -eq 0 ]] && BANG=""
  if [[ "$HOSTNAME" == "vortex" && -z "$DISPLAY" ]]; then
    BANG="$" 
  fi

  export PS1="$(hg_branch_info)$(git_branch_info)$(python_virtual_env)${helper}%{$fg[${COLOUR}]%}${suffix}${BANG}%{$reset_color%} "
}
