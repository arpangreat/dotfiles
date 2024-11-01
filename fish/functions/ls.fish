function ls
    command eza -l -g --color always $argv[1] | bat
end
