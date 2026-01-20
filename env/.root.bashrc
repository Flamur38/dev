# ~/.bashrc — root
# executed for non-login interactive shells

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# ---------------------------
# Force color prompt (IMPORTANT)
# ---------------------------
force_color_prompt=yes

# ---------------------------
# History behavior
# ---------------------------
HISTCONTROL=ignoredups:ignorespace
shopt -s histappend
HISTSIZE=1000
HISTFILESIZE=2000

# ---------------------------
# Window size
# ---------------------------
shopt -s checkwinsize

# ---------------------------
# lesspipe
# ---------------------------
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# ---------------------------
# Detect chroot
# ---------------------------
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# ---------------------------
# Enable colors
# ---------------------------
if [ -n "$force_color_prompt" ]; then
    if command -v tput >/dev/null 2>&1 && tput setaf 1 >/dev/null 2>&1; then
        color_prompt=yes
    fi
fi

# ==========================================================
# PROMPT HELPERS (REAL IMPLEMENTATIONS)
# ==========================================================

git_ps1() {
  git rev-parse --is-inside-work-tree >/dev/null 2>&1 || return 0

  local branch
  branch="$(git branch --show-current 2>/dev/null)"
  [ -z "$branch" ] && branch="detached:$(git rev-parse --short HEAD 2>/dev/null)"

  local gray='\033[38;2;100;116;139m'
  local teal='\033[38;2;45;212;191m'
  local red='\033[38;2;239;68;68m'
  local reset='\033[0m'

  if git diff --quiet && git diff --cached --quiet; then
    printf "%b (%b%s%b)%b" "$gray" "$teal" "$branch" "$gray" "$reset"
  else
    printf "%b (%b%s*%b)%b" "$gray" "$red" "$branch" "$gray" "$reset"
  fi
}

ps1_ssh() {
  [ -n "$SSH_CONNECTION" ] && printf "\033[38;2;250;204;21m[ssh]\033[0m "
}

ps1_root() {
  [ "$EUID" -eq 0 ] && printf "\033[38;2;239;68;68m[root]\033[0m "
}

ps1_symbol() {
  if [ "$EUID" -eq 0 ]; then
    printf "\033[38;2;239;68;68m#\033[0m "
  else
    printf "\033[38;2;239;68;68m$\033[0m "
  fi
}

ps1_exit() {
  local code=${__ps1_last_exit:-0}
  [ "$code" -ne 0 ] && printf "\033[38;2;239;68;68m[%d]\033[0m " "$code"
}


# ==========================================================
# PROMPT
# ==========================================================

if [ "$color_prompt" = yes ]; then
    # PS1='$(ps1_ssh)$(ps1_root)\[\033[0;34m\]@\h \[\033[38;2;100;116;139m\]:: \[\033[38;2;230;237;243m\]\w$(git_ps1)\n$(ps1_symbol)'
    PS1='$(ps1_ssh)$(ps1_root)\[\033[38;2;230;237;243m\]\u@\h \[\033[38;2;100;116;139m\]:: \[\033[38;2;230;237;243m\]\w$(git_ps1)\n$(ps1_exit)$(ps1_symbol)'

else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w# '
fi

unset color_prompt force_color_prompt

# ---------------------------
# Xterm title
# ---------------------------
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
esac

# ---------------------------
# Aliases & colors
# ---------------------------
if [ -x /usr/bin/dircolors ]; then
    eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
fi

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

PROMPT_COMMAND='__ps1_last_exit=$?; printf "\n"'

