function burp() {
  tmux run-shell -b 'java -jar '"${HOME}"'/tools/burpsuite_pro.jar'
}

function firefox() {
  tmux run-shell -b "/usr/bin/firefox-nightly $@"
}

function chrome() {
  tmux run-shell -b "/usr/bin/chromium $@"
}

function chromium() {
  tmux run-shell -b "/usr/bin/chromium $@"
}

function telegram() {
  tmux run-shell -b "/usr/bin/telegram-desktop $@"
}

function discord() {
  tmux run-shell -b "/usr/bin/discord $@"
}

