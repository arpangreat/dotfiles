function vg
    set -l result (ag --nobreak --noheading $argv | fzf -0 -1 | awk -F: '{print $1, $2}')
    set -l file (echo $result | cut -d ' ' -f 1)
    set -l line (echo $result | cut -d ' ' -f 2)

    if test -n "$file"
        $EDITOR $file +$line
    end
end
