function vf
    if test (count $argv) -eq 0
        echo "Usage: vf <regex>"
        return 1
    end

    set -l query $argv

    if test (count $matches) -eq 0
        echo "No matches found for: $query"
        return 1
    end

    set -l files (
        rg --null --files-with-matches --hidden --no-ignore-vcs "$query" . \
        | fzf --read0 -0 -1 -m \
            --preview "rg --color=always --line-number --context=5 '$query' {} \
            | bat --style=numbers --color=always --paging=never"
    )

    if test -n "$files"
        $EDITOR -- $files
        echo $files[1]
    end
end
