# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc


# CustomBin 
export LOCALBIN="$HOME/dotfiles/.config/.local/bin"
if ! [[ $PATH =~ $LOCALBIN ]]; then
    PATH="$LOCALBIN:$PATH"
fi

# Nvim
# PATH="/opt/nvim-linux-x86_64/bin/:$PATH"

# Go
PATH="$HOME/go/bin:$PATH"
# Nvim
PATH="/opt/nvim-linux-x86_64/bin/:$PATH"


# Editor
export EDITOR="/opt/nvim-linux-x86_64/bin/nvim"
# Config
export XDG_CONFIG_HOME="$HOME/.config"
# Starship
export STARSHIP_CONFIG="$HOME/dotfiles/.config/starship/starship.toml"
# Nvim look for configuration files in $XDG_CONFIG_HOME/$NVIM_APPNAME
export NVIM_APPNAME="nvim-telescope"
# Obsidian vault
export VAULT="$HOME/notes/mynotes/logs-vault"
# Obsidian General vault
export GENERAL_VAULT="$HOME/notes/mynotes/obsidian-vault"
# Theme
export THEME="DARK"
# [DOT]files
export DOT="$HOME/dotfiles/.config"

alias ls='eza -al --icons=always --sort=type'
alias lt='eza -a --tree --level=1 --icons=always'

# Use syntax highlight for `cat`:
# -pp alias for '--style=plain --paging=never'
alias cat='bat -pp'

# history
alias h="cat $HOME/.bash_history | fzf | sh"

alias man="$LOCALBIN/manbat"
alias installdoc="$DOT/.local/bin/docs/installdocs"

# yt-dlp-[l]ocal
alias yt-dlp-l="python3 $HOME/dotfiles/.config/.local/bin/yt-dlp"

# python
alias py="python3"

# nvim prebuild
alias nvimp="~/downloads/nvim-linux-x86_64/bin/nvim"

# nvim
alias nvim="/opt/nvim-linux-x86_64/bin/nvim"

# tmux for temp sessions
alias txnt="tmux new -s $(uuidgen | rg ^.*?- -o)"

# alias pc="pnpm build && pnpm test && pnpm test:e2e && pnpm lint && pnpm check"
alias pc="pnpm build && pnpm test && pnpm lint && pnpm check"

# Initialize 
eval "$(starship init bash)"
eval "$(zoxide init bash)"
