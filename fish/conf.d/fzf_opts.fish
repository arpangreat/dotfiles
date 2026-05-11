# ── Base opts ──────────────────────────────────────────────────────────────────
set -gx FZF_DEFAULT_OPTS "\
    --color=spinner:#ff007c,hl:#2ac3de \
    --color=fg:#c0caf5,header:#ff9e64,info:#545c7e,pointer:#ff007c \
    --color=marker:#ff007c,fg+:#c0caf5,prompt:#2ac3de,hl+:#2ac3de \
    --color=selected-bg:#45475a,border:#29a4bd,gutter:#1f2335 \
    --color=query:#c0caf5:regular,scrollbar:#29a4bd \
    --color=gutter:-1,selected-bg:238,selected-fg:146,current-fg:189 \
    --height=80% \
    --border --no-multi --info=inline-right --layout=reverse \
    --marker=▏ --pointer='▎' --prompt='▎' --gutter-raw='▎' \
    --highlight-line --ansi \
    --bind='alt-k:preview-up,alt-p:preview-up' \
    --bind='alt-j:preview-down,alt-n:preview-down' \
    --bind='tab:toggle+down,shift-tab:toggle+up' \
    --bind='ctrl-r:change-multi' \
    --bind='ctrl-s:toggle-sort' \
    --bind='?:toggle-preview' \
    --bind='alt-w:toggle-preview-wrap' \
    --border-label=' alt-k/p:↑ | alt-j/n:↓ | ctrl-r:change-multi | ctrl-s:sort | ?:preview | alt-w:wrap | tab/shift-tab:next/prev ' \
    --border-label-pos=0:bottom"

# ── Ctrl+R — history ───────────────────────────────────────────────────────────
set -gx FZF_CTRL_R_OPTS "\
    --preview='echo {} | bat --color=always -l bash --plain' \
    --preview-window='right:60%' \
    --no-multi \
    --border-label=' alt-k/p:↑ | alt-j/n:↓ | ctrl-s:sort | ?:preview | alt-w:wrap | tab/shift-tab:next/prev ' \
    --border-label-pos=0:bottom"

# ── Ctrl+T — file finder ───────────────────────────────────────────────────────
set -gx FZF_CTRL_T_OPTS "\
    --preview='bat --color=always --line-range=:200 {}' \
    --preview-window='right:60%' \
    --border-label=' alt-k/p:↑ | alt-j/n:↓ | ctrl-s:sort | ?:preview | alt-w:wrap | tab/shift-tab:next/prev ' \
    --border-label-pos=0:bottom"

# ── Alt+C — cd into directory ──────────────────────────────────────────────────
set -gx FZF_ALT_C_OPTS "\
    --preview='eza --tree --color=always --icons=always --level=2 {} 2>/dev/null || ls -1 --color=always {}' \
    --preview-window='right:50%' \
    --no-multi \
    --border-label=' alt-k/p:↑ | alt-j/n:↓ | ?:preview | alt-w:wrap ' \
    --border-label-pos=0:bottom"

# ── Tab completion ─────────────────────────────────────────────────────────────
set -gx FZF_COMPLETION_OPTS "\
    --preview='~/.config/fish/functions/_fzf_completion_preview.sh {}' \
    --preview-window='right:60%' \
		--no-multi \
    --bind='ctrl-r:change-multi' \
    --border-label=' alt-k/p:↑ | alt-j/n:↓ | ctrl-r:change-multi | ?:preview | alt-w:wrap | tab/shift-tab:next/prev ' \
    --border-label-pos=0:bottom"

# ── forgit ─────────────────────────────────────────────────────────────────────
set -gx FORGIT_FZF_DEFAULT_OPTS "\
    --preview-window='right:60%' \
    --bind='alt-k:preview-up,alt-p:preview-up' \
    --bind='alt-j:preview-down,alt-n:preview-down' \
    --bind='?:toggle-preview' \
    --bind='alt-w:toggle-preview-wrap' \
    --bind='ctrl-s:toggle-sort' \
    --border-label-pos=0:bottom"
