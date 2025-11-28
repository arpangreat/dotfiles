function vf
    if test (count $argv) -eq 0
        echo "Usage: vf <regex>"
        return 1
    end
    
    set -l query $argv
    
    # Search for line matches, not just files
    set -l selection (
        rg --line-number --column --hidden --no-ignore-vcs --color=always "$query" . \
        | fzf --ansi --delimiter ':' \
            --preview "echo {} | cut -d: -f1 | xargs bat --style=numbers --color=always --highlight-line {2}" \
            --preview-window '+{2}/2'
    )
    
    if test -z "$selection"
        echo "No matches found for: $query"
        return 1
    end
    
    # Parse file:line:column from selection
    set -l file (echo $selection | cut -d: -f1)
    set -l line (echo $selection | cut -d: -f2)
    set -l col (echo $selection | cut -d: -f3)
    
    # Open editor at specific location
    $EDITOR "+$line" "$file"
    echo "$file:$line:$col"
end
