function lt
    command eza -l -g --git --tree --color=always --header --hyperlink --icons=auto $argv[1] | bat
end
