function toggle-touchpad() {
  _TOUCHPAD_STATE_PATH="${HOME}/.local/state/touchpad"
  TOUCHPAD_STATE=1

  if [ -f "${_TOUCHPAD_STATE_PATH}" ]; then
    TOUCHPAD_STATE=$(cat "${_TOUCHPAD_STATE_PATH}")
  fi

  TOUCHPAD_ID=$(xinput list | grep -Poie 'touchpad.*id=(\K\d+)')
  TOUCHPAD_DEVICE_ID=$(xinput list-props "${TOUCHPAD_ID}" | grep -Poie 'Device Enabled \(\K\d+')

  TOUCHPAD_STATE=$((1 - $TOUCHPAD_STATE))
  xinput set-prop "$TOUCHPAD_ID" "$TOUCHPAD_DEVICE_ID" "$TOUCHPAD_STATE"

  echo "$TOUCHPAD_STATE" > "${_TOUCHPAD_STATE_PATH}"
  [[ "$TOUCHPAD_STATE" -eq 0 ]] && echo "Touchpad has been disabled"
  [[ "$TOUCHPAD_STATE" -eq 1 ]] && echo "Touchpad has been enabled"
}
