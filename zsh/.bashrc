
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

# ── soc prompt ────────────────────────────────────────
# uses ansi indices, not hex — so it inherits whatever palette the
# terminal has. on your soc profile that resolves to:
#   32 green #3dd68c   31 red #ff4d5e   34 blue #3b9eff
#   36 cyan  #22d3ee   33 amber #ffb020  90 grey #4b5563
#
# colour meaning matches nvim and tmux:
#   blue = path/structure, cyan = identity/metadata,
#   amber = needs attention, red = something failed
__soc_prompt() {
  local st=$? ref dirty='' gseg='' code='' host=''

  # remote indicator — only renders when you're not on the local box
  [ -n "$SSH_CONNECTION" ] && host="\[\e[0;36m\]\u@\h "

  ref=$(git symbolic-ref -q --short HEAD 2>/dev/null) \
    || ref=$(git rev-parse --short HEAD 2>/dev/null)
  if [ -n "$ref" ]; then
    git diff --quiet --ignore-submodules HEAD 2>/dev/null || dirty='\[\e[0;33m\]✗'
    gseg=" \[\e[0;90m\]git:(\[\e[0;36m\]${ref}\[\e[0;90m\])${dirty}"
  fi

  local arrow='\[\e[1;32m\]➜'
  if [ $st -ne 0 ]; then
    arrow='\[\e[1;31m\]➜'
    code=" \[\e[0;31m\]${st}"                      # exit code, only on failure
  fi

  PS1="${arrow}${code}  ${host}\[\e[1;34m\]\W${gseg}\[\e[0m\] "
}
PROMPT_COMMAND="__soc_prompt${PROMPT_COMMAND:+; $PROMPT_COMMAND}"
