setopt AUTO_CD
setopt MULTIOS
setopt NOCORRECT
setopt AUTO_NAME_DIRS
setopt NO_BEEP

setopt BANG_HIST
setopt EXTENDED_HISTORY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_SPACE
setopt HIST_SAVE_NO_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY

setopt extendedglob
setopt promptsubst
setopt complete_aliases
setopt -o emacs
setopt interactivecomments

bindkey "\e[3~" delete-char           # zsh
bindkey "^H"    backward-delete-word  # zsh
bindkey "^X^E" edit-command-line
