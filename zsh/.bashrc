# ~/.bashrc
case $- in
    *i*) ;;
      *) return;;
esac

HISTCONTROL=ignoreboth
shopt -s histappend
HISTSIZE=1000
HISTFILESIZE=2000
shopt -s checkwinsize

[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# color support
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# aliases
alias ll='ls -lF'
alias la='ls -lahr'
alias l='ls -CF'

# bash completion
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

bind 'set completion-ignore-case on'

export PATH=/home/flamy/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/home/flamy/.local/apps:/home/flamy/.local/scripts:/home/flamy/.local/odin/:/opt/zeek/bin

# ======================
# PS1 — juliana palette
# brackets: #46525C dim
# time:     #F97B58 orange
# path:     #5C99D6 blue
# dirty:    #C695C6 purple *
# $:        #99C794 green / #EC5F66 red
# ======================
__git_dirty() {
    local unpushed
    unpushed=$(git log @{u}.. 2>/dev/null | wc -l)
    local dirty
    dirty=$(git status --porcelain 2>/dev/null | wc -l)
    if [[ "$unpushed" -gt 0 ]] || [[ "$dirty" -gt 0 ]]; then
        echo " \[\e[38;2;198;149;198m\]*\[\e[0m\]"
    fi
}

__flamy_ps1() {
    local exit_code=$?
    local bracket="\[\e[38;2;153;199;148m\]"
    local reset="\[\e[0m\]"
    local time="\[\e[38;2;249;123;88m\]\@\[\e[0m\]"
    local path="\[\e[1;38;2;92;153;214m\]\W\[\e[0m\]"
    local dirty=""
    if git rev-parse --is-inside-work-tree &>/dev/null; then
        dirty=$(__git_dirty)
    fi
    local dollar
    if [[ $exit_code -eq 0 ]]; then
        dollar="\[\e[1;38;2;153;199;148m\]\$\[\e[0m\]"
    else
        dollar="\[\e[1;38;2;236;95;102m\]\$\[\e[0m\]"
    fi
    PS1="${bracket}[${reset}$time${bracket}:${reset}$path$dirty${bracket}]${reset}$dollar "
}

PROMPT_COMMAND=__flamy_ps1
