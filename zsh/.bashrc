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

# set_prompt() {
#   # local muted='\[\e[1;38;2;166;172;185m\]'      # fg3     #a6acb9
#   local muted='\[\e[1;38;5;244m\]'      # fg3     #a6acb9
#   local blue='\[\e[1;38;2;92;153;214m\]'        # blue2   #5c99d6
#   local green='\[\e[1;32m\]'                    # red1    #c76b70
#   local red='\[\e[0;31m\]'                    # red1    #c76b70
#   local text='\[\e[1;38;2;216;222;233m\]'       # fg2     #d8dee9
#   local reset='\[\e[0m\]'
#
#   PS1="${red}\t ${green}\u${muted}:${blue}\W${muted}\$ ${reset}"
# }
# PROMPT_COMMAND=set_prompt


parse_git_branch() {
    git branch --show-current 2>/dev/null
}

PS1='\[\e[38;5;45m\]➜ \
\[\e[38;5;81m\]\W\
$(branch=$(parse_git_branch); [[ -n $branch ]] && echo " \[\e[38;5;190m\]git:($branch)")\
\[\e[0m\] \$ '
