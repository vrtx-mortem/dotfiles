function lolbin {
  url="https://s.lolwut.me/"

  if [ -p /dev/stdin ]; then
    arg="@-"
  elif [ -f "$1" ]; then
    arg="@$1"
  else
    return 1
  fi

  blob_id=$(curl -Ss "${url}" -F "file=${arg}")
  blob_url="${url}${blob_id}"

  if command -v xclip >/dev/null; then
    echo -n "${blob_url}" | xclip -selection clipboard -in
  fi
  echo "${blob_url}"
}
