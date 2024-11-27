export fpath=("$HOME/.zsh/completion/" $fpath)
typeset -U fpath

export HOSTNAME="$(hostname)"

export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"
if [[ "$HOSTNAME" == "vortex" ]]; then
  export LC_PAPER="uk_UA.UTF-8"
  export LC_MEASUREMENT="uk_UA.UTF-8"
  export LC_TIME="uk_UA.UTF-8"
fi

export HISTFILE="$HOME/.zsh/hist/${HOSTNAME}.history"
export HISTSIZE=100000
export SAVEHIST=500000

export GOPATH="$HOME/.go"
export ANDROID_HOME="/opt/android-sdk"
export PATH="/usr/sbin:/usr/bin:/bin"
export PATH="${PATH}:${HOME}/.local/bin"
export PATH="${PATH}:${GOPATH}/bin"
export PATH="${PATH}:${ANDROID_HOME}/emulator:${ANDROID_HOME}/platform-tools"

export EDITOR="$(command -v nvim)"
export PAGER="$(command -v less)"
export LESS="RFX"

# QEMU
export QEMU_LD_PREFIX=/usr/arm-linux-gnueabihf

# fix java to use system fonts
export _JAVA_OPTIONS=" -Dswing.aatext=true -Dawt.useSystemAAFontSettings=on"
# fix java dropdown menu (java gtk bug?)
export _JAVA_AWT_WM_NONREPARENTING=1
export PYTHONDONTWRITEBYTECODE=1

# Pinentry
export GPG_TTY=$(tty)
export TTY="$GPG_TTY"
