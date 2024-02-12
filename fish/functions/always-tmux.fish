function _not_in_tmux() 
  [[ -z "$TMUX" ]]
end

function ensure_tmux_is_running()
    if _not_in_tmux; then
        tat
    end
end

ensure_tmux_is_running()
