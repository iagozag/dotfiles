# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

export EDITOR=nvim
export VISUAL=nvim

SAVEHIST=100000
HISTSIZE=100000

# ZSH_THEME="aussiegeek"

# Custom Prompt
source "$HOME/.cache/wal/colors.sh"
setopt PROMPT_SUBST

PROMPT=' %B%F{$foreground}%1~%B%F{$color3}  %F{$foreground}'
RPROMPT='%B%F{$color1}$(parse_git_branch)%F{$color11}$(parse_git_dirty)%B %F{$color1}%@'

parse_git_dirty() {
  STATUS="$(git status 2> /dev/null)"
  if [[ $? -ne 0 ]]; then printf ""; return; else printf " ["; fi
  if echo ${STATUS} | grep -c "renamed:"         &> /dev/null; then printf " Renamed "; else printf ""; fi
  if echo ${STATUS} | grep -c "branch is ahead:" &> /dev/null; then printf " Ahead"; else printf ""; fi
  if echo ${STATUS} | grep -c "new file::"       &> /dev/null; then printf " Added "; else printf ""; fi
  if echo ${STATUS} | grep -c "Untracked files:" &> /dev/null; then printf " Untracked "; else printf ""; fi
  if echo ${STATUS} | grep -c "modified:"        &> /dev/null; then printf " Modified "; else printf ""; fi
  if echo ${STATUS} | grep -c "deleted:"         &> /dev/null; then printf " Deleted "; else printf ""; fi
  printf "] "
}

parse_git_branch() {
  # Long form
   git rev-parse --abbrev-ref HEAD 2> /dev/null
  # Short form
   # git rev-parse --abbrev-ref HEAD 2> /dev/null | sed -e 's/.*\/\(.*\)/\1/'
}

(cat ~/.cache/wal/sequences &)

plugins=(
git
zsh-autosuggestions
zsh-syntax-highlighting
exa-zsh
)

source $ZSH/oh-my-zsh.sh

# Aliases

# sudo
alias sudo="doas"
alias sudoedit="doas vim"

# cd ..
alias ..="cd .."

# cd codes
alias codes="cd ~/Documents/school/codes"

# copy temp.cpp to new file
alias temp="cp ~/Documents/school/codes/temp.cpp"

# cd prog_subjects
alias prog="cd ~/Documents/school/ufmg/programmingSubjects"

# remove
alias rm="rm -i"

# command history
alias gh="history|grep"

# mkdir with more than one directory
alias mkdir="mkdir -pv"

# neofetch
alias nf="neofetch"

# moar
alias more="moar"

# ips show
alias ips="ip -c -br a"

# nvim
alias v="nvim"
alias vim="nvim"

# exa
alias ls='exa -a --icons --group-directories-first' # just replace ls by exa and allow all other exa arguments
alias l='ls -lbF' #   list, size, type
alias ll='ls -la' # long, all
alias llm='ll --sort=modified' # list, long, sort by modification date
alias la='ls -lbhHigUmuSa' # all list
alias lx='ls -lbhHigUmuSa@' # all list and extended
alias tree='ls --tree --icons' # tree view
alias lS='ls -1 --icons --group-directories-first' # one column by just names

# apps installed
alias yay-list="comm -23 <(yay -Qqe | sort) <({ yay -Qqg base-devel; expac -l '\n' '%E' base; } | sort -u) | fzf --preview 'yay -Qil {}' --layout=reverse --bind 'enter:execute(yay -Qil {} | moar)'"

# dotfiles
alias dots='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

eval $(thefuck --alias fuck)
