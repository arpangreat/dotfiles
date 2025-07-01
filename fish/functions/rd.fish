function rd
    # Check if any argument is provided, default to current directory if not
    set -l search_dir (count $argv) >/dev/null; and echo $argv[1]; or echo "."

    # Use fd to find directories, including hidden ones, and pass the results to fzf for fuzzy selection
    set -l dir (fd --type d --hidden --exclude .git --search-path="$search_dir" | fzf +m)

    # If a directory is selected, change to that directory
    if test -n "$dir"
        cd "$dir"
    end
end

# function rd
#     # Determine the search directory, default to the current directory if no argument is provided
#     set -l search_dir (if test (count $argv) -gt 0; echo $argv[1]; else echo .; end)

#     # Use fd to find directories, including hidden ones, and pass the results to fzf
#     set -l dir (fd --type d --hidden --exclude .git --search-path="$search_dir" | fzf +m)

#     # If a directory is selected, change to that directory
#     if test -n "$dir"
#         cd "$dir"
#     end
# end
