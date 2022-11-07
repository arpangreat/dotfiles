_not_in_tmux() { [[ -z "$ZELLIJ" ]] }

ensure_zellij_is_running() {
  if _not_in_tmux; then
    zellij 
  fi
}
