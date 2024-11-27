#_fzf_comprun() {
#  local command=$1
#  shift
#
#  case "$command" in
#    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
#    export|unset) fzf --preview "eval 'echo \$'{}"         "$@" ;;
#    ssh)          fzf --preview 'dig {}'                   "$@" ;;
#    *)            fzf --preview "bat -n --color=always --line-range :500 {}" "$@" ;;
#  esac
#}
