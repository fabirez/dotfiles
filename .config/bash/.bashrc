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

# config
export DOT="$HOME/dotfiles/.config"
if ! [[ $PATH =~ $dot ]]; then
    PATH="$PATH:$DOT//"
fi

# Zeit
export ZEIT_DB=~/.config/zeit.db

# bun
export BUNPATH="$HOME/.bun"
if ! [[ $PATH =~ $BUNPATH ]]; then
    PATH="$BUNPATH/bin:$PATH"
fi
# Mybin
export MYBINPATH="$HOME/mybin"
if ! [[ $PATH =~ $MYBINPATH ]]; then
    PATH="$MYBINPATH:$PATH"
fi

# CustomBin
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
# CONFING
export XDG_CONFIG_HOME="$HOME/.config"

alias eza='~/.cargo/bin/eza'
# alias ls='eza -a --icons=always'
alias ll='eza -al --icons=always'
alias lt='eza -a --tree --level=1 --icons=always'

# alias txnw="sh ~/code/shellScripting/tmux9.sh $1"
alias man="$DOT/.local/bin/manbat $1"
alias installdoc="$DOT/.local/bin/docs/installdocs $1"
alias ctw="$DOT/.local/bin/change_wallpaper"
alias eww="~/eww/target/release/eww"
alias gho="$DOT/.local/bin/github-open"

# Use syntax highlight for `cat`:
# -pp alias for '--style=plain --paging=never'
alias cat='bat -pp'

alias h="cat $HOME/.bash_history | fzf | sh"

alias check="$DOT/.local/bin/check_diff"

eval "$(starship init bash)"
eval "$(zoxide init bash)"












