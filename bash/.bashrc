# ~/.bashrc — optimized for security, productivity, and clarity
# -------------------------------------------------------------

# prevents system binaries from overriding your personal scripts.
export PATH="$HOME/bin:$HOME/.local/bin:$PATH"

#safety for destructive commands

alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

# Automatically correct small typos (optional)
shopt -s cdspell


# Loaded for *interactive* shells only
case $- in
    *i*) ;;
      *) return;;
esac

# ==========================
# 1. HISTORY IMPROVEMENTS
# ==========================

# Avoid duplicates and ignore commands starting with a space
export HISTCONTROL=ignoreboth

# Much larger history (persistent across months/years)
export HISTSIZE=50000
export HISTFILESIZE=200000

# Show timestamps in history
export HISTTIMEFORMAT="%Y-%m-%d %H:%M:%S  "

# Append instead of overwriting history at session end
shopt -s histappend

# Sync history across multiple terminals
PROMPT_COMMAND="history -a; history -n; $PROMPT_COMMAND"

# ==========================
# 2. SHELL BEHAVIOR
# ==========================
# Detect terminal size after every command
shopt -s checkwinsize

# Allow recursive globbing using ** (optional)
# shopt -s globstar

# Improve 'less' behavior
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# ==========================
# 3. PROMPT (PS1)
# ==========================
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi

# Set title for xterm
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
esac

# ==========================
# 4. COLORS AND ALIASES
# ==========================
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" \
        || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Notify you when long commands finish
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" \
"$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Load user aliases (if exists)
[ -f ~/.bash_aliases ] && . ~/.bash_aliases

# ==========================
# 5. BASH COMPLETION
# ==========================
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# ==========================
# 6. CONDA INITIALIZATION
# ==========================
# (This block is automatically managed by conda)
__conda_setup="$('/home/ets/jmontecinos@ad.etsmtl.ca/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/ets/jmontecinos@ad.etsmtl.ca/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/ets/jmontecinos@ad.etsmtl.ca/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/ets/jmontecinos@ad.etsmtl.ca/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup

