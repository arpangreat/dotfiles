function vf
    set -l files (locate -Ai -0 $argv | grep -z -vE '~$' | fzf-tmux --read0 -0 -1 -m)

    if test -n "$files"
        nvim -- $files
        echo $files[1]
    end
end
