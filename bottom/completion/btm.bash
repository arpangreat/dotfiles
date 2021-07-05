_btm() {
    local i cur prev opts cmds
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    cmd=""
    opts=""

    for i in ${COMP_WORDS[@]}
    do
        case "${i}" in
            btm)
                cmd="btm"
                ;;
            
            *)
                ;;
        esac
    done

    case "${cmd}" in
        btm)
            opts=" -k -f -c -b -S -m -g -a -l -R -T -u -W -h -V -C -t -r -d  --kelvin --fahrenheit --celsius --autohide_time --basic --battery --case_sensitive --process_command --mem_as_value --disable_click --dot_marker --group --hide_avg_cpu --hide_table_gap --hide_time --show_table_scroll_position --left_legend --disable_advanced_kill --regex --tree --network_use_bytes --network_use_log --network_use_binary_prefix --current_usage --use_old_network_legend --whole_word --help --version --config --color --default_time_value --default_widget_count --default_widget_type --rate --time_delta  "
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 1 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                
                --config)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                    -C)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --color)
                    COMPREPLY=($(compgen -W "default default-light gruvbox gruvbox-light nord nord-light" -- "${cur}"))
                    return 0
                    ;;
                --default_time_value)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                    -t)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --default_widget_count)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --default_widget_type)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --rate)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                    -r)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --time_delta)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                    -d)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        
    esac
}

complete -F _btm -o bashdefault -o default btm
