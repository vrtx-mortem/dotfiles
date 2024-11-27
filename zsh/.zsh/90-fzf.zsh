command -v fzf 2>&1 >/dev/null || return

eval "$(fzf --zsh)"

fzf_colour_fg="#CBE0F0"
fzf_colour_bg="#011628"
fzf_colour_bg_highlight="#143652"
fzf_colour_purple="#B388FF"
fzf_colour_blue="#06BCE4"
fzf_colour_cyan="#2CF9ED"

export FZF_DEFAULT_OPTS="--color=fg:${fzf_colour_fg},bg:${fzf_colour_bg},hl:${fzf_colour_purple},fg+:${fzf_colour_fg},bg+:${fzf_colour_bg_highlight},hl+:${fzf_colour_purple},info:${fzf_colour_blue},prompt:${fzf_colour_cyan},pointer:${fzf_colour_cyan},marker:${fzf_colour_cyan},spinner:${fzf_colour_cyan},header:${fzf_colour_cyan}"


_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}

export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always --line-range :500 {}'"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"
