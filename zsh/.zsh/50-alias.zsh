alias grep='grep --color=auto'
alias nmap='nmap --privileged'
alias fix-nmap="doas -- setcap cap_net_raw,cap_net_admin,cap_net_bind_service+eip /usr/bin/nmap"
alias ls='ls --group-directories-first --color'
alias l='ls'
alias ll='ls -la'
alias lh='ls -lha'
alias li='ls -lia'
alias mysql='mysql --auto-rehash'
alias ipi='ipython3 --no-banner'
alias ipi2='ipython2 --no-banner'
alias ipi3='ipython3 --no-banner'
alias mpc='mpc --host=$HOME/.config/mpd/mpd.socket'

alias idaq32='firejail --net=none --private-tmp --restrict-namespaces --read-only=/ ~/tools/ida/nidaq'
alias idaq64='firejail --net=none --private-tmp --restrict-namespaces --read-only=/ ~/tools/ida/nidaq64'
alias sqlmap='~/src/sqlmap/sqlmap.py'
alias htb-server='~/src/htb-server/server.py'

#alias -s {jar}='java -jar'
#alias -s {mp4,m4a,mp3,mkv,avi}='mplayer'
#alias -s {gif,htm,html}='firefox'
#alias -s {png,jpg,jpeg}='feh'

alias sort-ip='sort -n -t . -k 1,1 -k 2,2 -k 3,3 -k 4,4'

#alias debian-armel-qemu='qemu-system-arm -M versatilepb -kernel ~/ISO/armel/vmlinuz-3.16.0-4-versatile -initrd ~/ISO/armel/initrd.img-3.16.0-4-versatile -append "root=/dev/sda1" -hda ~/ISO/armel/debian_hda.img -no-reboot -net nic,vlan=0 -net tap,ifname=tap0,vlan=0,script=no'

alias restore-wallpaper='grep hsetroot ~/.local/share/dwm/autostart.sh | sh'
alias remove-wallpaper='hsetroot'
alias блядь='grep setxkbmap ~/.xinitrc | sh'
alias tolower='tr "[:upper:]" "[:lower:]"'
alias toupper='tr "[:lower:]" "[:upper:]"'

alias v='nvim'
alias vim='nvim'
alias vimdiff='nvim -d'
alias м='nvim'
alias мшь='nvim'

alias dnsdump='~/src/dnsdump/dnsdump.py --format domain --type a --domain'
alias git-tree='git log --graph --pretty=oneline --abbrev-commit'

alias ua='setxkbmap -layout "us,ua" -option "grp:caps_toggle,grp_led:scroll"'
alias ru='setxkbmap -layout "us,ru" -option "grp:caps_toggle,grp_led:scroll"'

alias windows-vm='/usr/lib/virtualbox/VirtualBoxVM --comment winbox --startvm a46137d4-5d67-4dde-9877-1fc3fe37754a --no-startvm-errormsgbox'
alias gdbserver='gdbserver --no-startup-with-shell'
