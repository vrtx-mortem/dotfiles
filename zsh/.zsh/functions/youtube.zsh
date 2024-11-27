function get-youtube-audio() {
  youtube-dl --output "%(title)s.%(ext)s" -f $(youtube-dl -F "$1" | grep 'audio only' | tail -1 | cut -f1 -d\ ) "$1"
}
