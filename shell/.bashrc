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

#
# aliases
#
    if [ -f ~/.bash_aliases ]; then
        . ~/.bash_aliases
    fi

    # https://www.reddit.com/r/linux4noobs/comments/jkvoyo/how_to_logout_via_command_prompt/?rdt=33488
    alias logout="loginctl terminate-user littmir"

    export EDITOR='/usr/bin/subl -n'
    alias s="$EDITOR -n"
    alias subl="subl -n"

    alias pdf-viewer="evince"
    alias img-viewer="loupe"

    alias ip="ip -c"
    alias mv="mv -i"
    alias untar="tar -zxvf"
    alias diff="diff -ruN --color"

    alias ..="cd ../"
    alias ~="cd ~/"