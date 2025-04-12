function ls
    command eza -l -g --git --color always $argv[1] | bat
end
