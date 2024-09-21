function fe
    set -l files (fzf --query="$argv[1]" --multi --select-1 --exit-0)
    if test -n "$files"
        $EDITOR $files
    end
end
