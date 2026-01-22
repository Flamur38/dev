# ~/.bashrc — user (flamy)
# Executed by bash for interactive non-login shells
# Goal: clean, minimal, SOC / IR–friendly environment

# ==========================================================
# INTERACTIVE SHELL CHECK
# ==========================================================
# Do nothing if not running interactively
case $- in
    *i*) ;;
      *) return ;;
esac

# ==========================================================
# HISTORY BEHAVIOR
# ==========================================================
# Ignore duplicates and commands starting with space
HISTCONTROL=ignoreboth

# Append to history file instead of overwriting
shopt -s histappend

# History size
HISTSIZE=1000
HISTFILESIZE=2000

# ==========================================================
# SHELL BEHAVIOR
# ==========================================================
# Update LINES and COLUMNS after each command
shopt -s checkwinsize

# Make `less` handle non-text files nicely
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# ==========================================================
# CHROOT DETECTION (Debian-based systems)
# ==========================================================
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# ==========================================================
# COLOR PROMPT DETECTION
# ==========================================================
# Enable colors for modern terminals
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes ;;
esac

# Force color prompt manually if desired
# force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if command -v tput >/dev/null 2>&1 && tput setaf 1 >/dev/null 2>&1; then
        color_prompt=yes
    else
        color_prompt=
    fi
fi

# ==========================================================
# PROMPT HELPERS (SOC / IR AWARENESS)
# ==========================================================

# --- Git prompt helper (clean / dirty, user only) ---
git_ps1() {
  git rev-parse --is-inside-work-tree >/dev/null 2>&1 || return 0

  local branch
  branch="$(git branch --show-current 2>/dev/null)"
  [ -z "$branch" ] && branch="detached:$(git rev-parse --short HEAD 2>/dev/null)"

  local gray='\033[38;2;100;116;139m'   # structure
  local teal='\033[38;2;45;212;191m'    # clean
  local red='\033[38;2;239;68;68m'      # dirty
  local reset='\033[0m'

  if git diff --quiet && git diff --cached --quiet; then
    printf "%b (%b%s%b)%b" "$gray" "$teal" "$branch" "$gray" "$reset"
  else
    printf "%b (%b%s*%b)%b" "$gray" "$red" "$branch" "$gray" "$reset"
  fi
}

# --- SSH indicator ---
ps1_ssh() {
  [ -n "$SSH_CONNECTION" ] && printf "\033[38;2;250;204;21m[ssh]\033[0m "
}

# --- Root indicator (user shell still detects it safely) ---
ps1_root() {
  [ "$EUID" -eq 0 ] && printf "\033[38;2;239;68;68m[root]\033[0m "
}

# --- Prompt symbol ($ vs #) ---
ps1_symbol() {
  if [ "$EUID" -eq 0 ]; then
    printf "\033[38;2;239;68;68m#\033[0m "
  else
    printf "\033[38;2;239;68;68m$\033[0m "
  fi
}

# --- Exit code indicator (failure only) ---
ps1_exit() {
  local code=${__ps1_last_exit:-0}
  [ "$code" -ne 0 ] && printf "\033[38;2;239;68;68m[%d]\033[0m " "$code"
}

# ==========================================================
# PROMPT DEFINITION
# ==========================================================
if [ "$color_prompt" = yes ]; then
    PS1='$(ps1_ssh)$(ps1_root)\
\[\033[0;34m\]\u@\h \
\[\033[38;2;100;116;139m\]:: \
\[\033[38;2;230;237;243m\]\w$(git_ps1)\
\n$(ps1_exit)$(ps1_symbol)'
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi

unset color_prompt force_color_prompt

# ==========================================================
# TERMINAL TITLE (xterm / tmux / rxvt)
# ==========================================================
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
esac

# ==========================================================
# ALIASES & COLOR SUPPORT
# ==========================================================
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi


# Notify on long-running commands
alias alert='notify-send --urgency=low \
  -i "$([ $? = 0 ] && echo terminal || echo error)" \
  "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# ==========================================================
# USER ALIASES (OPTIONAL)
# ==========================================================
[ -f ~/.bash_aliases ] && . ~/.bash_aliases

# ==========================================================
# BASH COMPLETION
# ==========================================================
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Case-insensitive tab completion
bind 'set completion-ignore-case on'

# ===============================
# Git quick update
# ===============================
gup() {
    branch=$(git branch --show-current)

    echo
    git status --short
    echo

    git add .
    git commit -m "${1:-updated}" || {
        echo "Nothing to commit"
        return
    }

    git push origin "$branch"
}


# ==========================================================
# PROMPT COMMAND
# ==========================================================
# Preserve last command exit code and add a blank line before prompt
PROMPT_COMMAND='__ps1_last_exit=$?; printf "\n"'

