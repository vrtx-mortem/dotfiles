function record-video() {
  # pactl list sources short | cut -f2
  ffmpeg \
    -f x11grab \
    -s $(xdpyinfo | grep dimensions | awk '{print $2;}') \
    -i :0.0 \
    -f pulse \
    -i alsa_output.pci-0000_00_1b.0.analog-stereo.monitor \
    -c:v libx264 \
    -preset ultrafast \
    -crf 0 \
    -c:a aac \
    ${1:-output.mkv}
}
