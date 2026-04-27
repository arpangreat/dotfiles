function vg
    set -l result (rg --color=always --line-number --no-heading --smart-case $argv | fzf \
        -0 -1 --ansi \
        --delimiter=':' \
        --preview='bat --color=always --style=numbers --highlight-line {2} {1}' \
        --preview-window='right:60%,+{2}/2')

    set -l file (echo $result | cut -d: -f1)
    set -l line (echo $result | cut -d: -f2)
    if test -n "$file"
        $EDITOR $file +$line
    end
end
