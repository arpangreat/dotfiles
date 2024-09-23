function __select_from_last
    set -l FZF_OUT (eval $history[1] | fzf)

    if test -n "$FZF_OUT"
        commandline -r $FZF_OUT
        commandline --cursor 0
    end
end
