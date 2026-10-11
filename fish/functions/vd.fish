function vd
    set -l search_dir .
    set -l query ""

    if test (count $argv) -gt 0
        if test -d "$argv[1]"
            set search_dir $argv[1]
            if test (count $argv) -gt 1
                set query $argv[2..-1]
            end
        else
            set query $argv
        end
    end

    set -l fzf_query_arg
    if test -n "$query"
        set fzf_query_arg --query="$query"
    end

    set -l dir (fd --type d --hidden --exclude .git . "$search_dir" 2>/dev/null | fzf \
        -0 -1 --ansi \
        $fzf_query_arg \
        --preview='eza --tree --color=always --icons=always --level=2 {} 2>/dev/null || ls -1 --color=always {}' \
        --preview-window='right:60%')

    if test -n "$dir"
        cd "$dir"
    end
end
