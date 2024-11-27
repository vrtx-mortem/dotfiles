function lolimg() {
  url="https://s.lolwut.me/"

  if [ -p /dev/stdin ]; then
    arg="@-"
  elif [ -f "$1" ]; then
    arg="@$1"
  else
    filepath=$(mktemp -u --suffix=.png)
    scrot -f -F "${filepath}" -e 'optipng $f' -s
    arg="@${filepath}"
    if command -v xclip >/dev/null; then
      xclip -t image/png -selection clipboard -in "$filepath"
      return
    fi
  fi

  shot_id=$(curl -v "${url}" -F "file=${arg}" 2>&1 | grep -Poe '(?<=Location: \/).*[^\r\n]')
  shot_url="${url}${shot_id}"
  [[ -f "${filepath}" ]] && rm -f "${filepath}"

  if command -v xclip >/dev/null; then
    echo -n "${shot_url}" | xclip -selection clipboard -in
  fi
  echo "${shot_url}"
}
