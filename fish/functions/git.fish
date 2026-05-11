function git
    if test (count $argv) -eq 0
        command git log --graph --all -n 20 --format="tformat:%C(yellow)%h %C(bold blue)%<(12,trunc)%an%C(reset) %C(green)%ar%C(reset) %s %C(dim)%D%C(reset)"
    else if test "$argv[1]" = "root"
        set repo (command git rev-parse --show-toplevel 2>/dev/null)
        if test $status -eq 0
            cd $repo
        else
            echo "Not inside a Git repository"
            return 1
        end
    else
        command git $argv
    end
end
