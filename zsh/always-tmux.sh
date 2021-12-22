_not_in_tmux() { [[ -z "$TMUX" ]] }

ensure_tmux_is_running() {
  if _not_in_tmux; then
    tat 
  fi
}
