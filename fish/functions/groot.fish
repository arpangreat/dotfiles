function groot --description 'Go to the root of the current Git repository'
    set repo (git rev-parse --show-toplevel 2>/dev/null)
    if test $status -eq 0
        cd $repo
    else
        echo "Not inside a Git repository"
        return 1
    end
end
