function kotor2 {
  WINEPREFIX="${HOME}/games/KOTOR2" \
  wine "${HOME}/games/KOTOR2/drive_c/Star Wars - KotOR II (UE)/SSELauncher.exe"
}

function gothic2 {
  WINEPREFIX="${HOME}/games/Gothic2" \
  wine "${HOME}/games/Gothic2/drive_c/Gothic2/system/GothicStarter.exe"
}

function factorio {
  ${HOME}/games/factorio/bin/x64/factorio # --disable-audio
}

function grimdawn {
  export WINEPREFIX="${HOME}/games/Grim_Dawn/"
  pushd "${WINEPREFIX}/drive_c/GrimDawn/"
  wine "Grim Dawn.exe" /x64
  popd
  unset WINEPREFIX
}
