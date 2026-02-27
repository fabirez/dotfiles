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

# DOTFILES
export DOT="$HOME/dotfiles/.config"
if ! [[ $PATH =~ $dot ]]; then
    PATH="$PATH:$DOT//"
fi

# CustomBin (where i took the script like txnw)
export LOCALBIN="$HOME/dotfiles/.config"
if ! [[ $PATH =~ $LOCALBIN ]]; then
    PATH="$LOCALBIN/.local/bin:$PATH"
fi

# Go
export PATH="$HOME/go/bin:$PATH"
# Eww
export eww="$HOME/eww/target/release/eww"
# Flutter
export flutter="$HOME/develop/flutter/bin/flutter:$PATH"
# Nvim
export PATH="$PATH:/opt/nvim-linux-x86_64/bin"
# Editor
export EDITOR="/usr/bin/nvim"
# CONFING
export XDG_CONFIG_HOME="$HOME/.config"
# Starship
export STARSHIP_CONFIG="$HOME/dotfiles/.config/starship/starship.toml"

alias ls='eza -a --icons=always'
alias ll='eza -al --icons=always'
alias lt='eza -a --tree --level=1 --icons=always'

# Use syntax highlight for `cat`:
# -pp alias for '--style=plain --paging=never'
alias cat='bat -pp'

# history
alias h="cat $HOME/.bash_history | fzf | sh"

# alias man="$DOT/.local/bin/manbat $1"
alias installdoc="$DOT/.local/bin/docs/installdocs $1"

# yt-dlp
alias yt-dlp="python3 $HOME/dotfiles/.config/.local/bin/yt-dlp"

# Initialize 
eval "$(starship init bash)"
eval "$(zoxide init bash)"
