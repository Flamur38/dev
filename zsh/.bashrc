
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


# ── robbyrussell ──────────────────────────────────────
# faithful bash port of the oh-my-zsh theme.
#
# the upstream theme uses ansi slot numbers:
#   arrow   bold green / bold red    (\e[1;32m / \e[1;31m)
#   dir     cyan, non-bold           (\e[0;36m)
#   git:(   bold blue                (\e[1;34m)
#   branch  red, non-bold            (\e[0;31m)
#   )       blue, non-bold           (\e[0;34m)
#   ✗       yellow                   (\e[0;33m)
#
# but slots resolve to whatever the terminal palette defines, and the soc
# profile redefines all sixteen — so the same codes come out wrong.
# these are hardcoded to the tango palette, which is what robbyrussell
# looks like in every screenshot. it now renders identically everywhere,
# independent of the terminal theme.
__rr_prompt() {
  local st=$? ref gseg=''

  ref=$(git symbolic-ref -q --short HEAD 2>/dev/null) \
    || ref=$(git rev-parse --short HEAD 2>/dev/null)

  if [ -n "$ref" ]; then
    #        git:( Foam/Blue #9ccfd8             branch Love/Red #eb6f92     ) Foam/Blue #9ccfd8
    gseg=" \[\e[38;2;156;207;216m\]git:(\[\e[38;2;235;111;146m\]${ref}\[\e[38;2;156;207;216m\])" 
    
    # untracked files count as dirty, same as oh-my-zsh's default
    #                                                  ✗ Gold/Yellow #f6c177
    [ -n "$(git status --porcelain 2>/dev/null)" ] && gseg+=" \[\e[38;2;246;193;119m\]✗"
  fi

  #             Pine/Green #31748f
  local arrow='\[\e[38;2;49;116;143m\]➜'
  
  #                               Love/Red #eb6f92
  [ $st -eq 0 ] || arrow='\[\e[38;2;235;111;146m\]➜'

  #                     dir Rose/Cyan #ea9a97                               Text/White #e0def4 for input
  PS1="${arrow}  \[\e[1;38;2;234;154;151m\]\W${gseg}\[\e[0m\] \[\e[1;38;2;224;222;244m\]"
}
# guard against duplicate entries when .bashrc is re-sourced
case "$PROMPT_COMMAND" in
  *__rr_prompt*) ;;
  *) PROMPT_COMMAND="__rr_prompt${PROMPT_COMMAND:+; $PROMPT_COMMAND}" ;;
esac




