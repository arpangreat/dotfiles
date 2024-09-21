function rda
    set -l dir (fd --type d --hidden --follow --exclude .git $argv[1] | fzf +m)
    if test -n "$dir"
        cd "$dir"
    end
end
