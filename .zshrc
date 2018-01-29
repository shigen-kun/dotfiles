## Language
# Use Japanese
export LANG=ja_JP.UTF-8
# Show Japanese file name
setopt print_eight_bit

## Directory
# Change directory without cd command
setopt autocd
# Auto ls after cd
function chpwd() { ls }
# Show cd history by "cd -[tab]"
setopt autopushd
# Don't show multi directory
setopt pushd_ignore_dups
# Auto cd after mkdir
function mkcd() {
  if [[ -d $1 ]]; then
    echo "$1 already exists!"
    cd $1
  else
    mkdir -p $1 && cd $1
  fi
}

## Theme
# Set colors
autoload -Uz colors
colors
# Colors for ls
export LSCOLORS=exfxcxdxbxegedabagacad
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

## Completion
# General setting
autoload -Uz compinit
compinit
# Can select by arrow key after completion
zstyle ':completion:*:default' menu select=2
# Match uppercase letter
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

## History
# Command history basics
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
# Append command history when using multiple zsh
setopt appendhistory
# Save command history before quit zsh
setopt inc_append_history
# Share command history with other zsh
setopt share_history
# Don't show duplicated command histories
setopt histignorealldups
# Ignore command history starting with space
setopt hist_ignore_space
# Delete excess space with command history 
setopt hist_reduce_blanks
# Wild card
setopt extended_glob

## Key bind
# Vim key bind
bindkey -v
# Incremental search by ctrl+r
bindkey '^r' history-incremental-pattern-search-backward

## Alias
alias c='clear'
alias la='ls -a'
alias ll='ls -l'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'
alias sudo='sudo '
alias -g L='| less'
alias -g G='| grep'
alias vi='nvim'
alias vim='nvim'

## Prompt
# PROMPT='%n%# '
# RPROMPT='%c'
PROMPT="%{${fg[green]}%}%n@%m%{${reset_color}%} %~
%# "

## Path
# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
alias brew="env PATH=${PATH/\/Users\/lin\/\.pyenv\/shims:/} brew"
# conda
alias activate="source $PYENV_ROOT/versions/anaconda3-5.0.1/bin/activate"
alias deactivate="source $PYENV_ROOT/versions/anaconda3-5.0.1/bin/deactivate"
# rbenv
export RBENV_ROOT="$HOME/.rbenv"
export PATH="$RBENV_ROOT/bin:$PATH"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

## zplug
# Road init file
source ~/.zplug/init.zsh
# zplug plugins
zplug "yous/vanilli.sh"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-history-substring-search"
zplug "chrissicool/zsh-256color"
zplug "mollifier/anyframe"
zplug "b4b4r07/enhancd", use:init.sh
# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
  printf 'Install? [y/N]: '
  if read -q; then
    echo; zplug install
  fi
fi
zplug load

## Neovim
export XDG_CONFIG_HOME=$HOME/.config

## Github
# RPROMPT="%{${fg[blue]}%}[%~]%{${reset_color}%}"
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }
RPROMPT='${vcs_info_msg_0_}'

## Others
# Enable # to comment
setopt interactive_comments
# Disable ctrl+D
setopt ignore_eof
# Enable globbing expression
setopt nomatch
# Notify job status immediately
setopt notify
# Modify spell miss
setopt correct
# Turn off the beep sound
unsetopt beep
