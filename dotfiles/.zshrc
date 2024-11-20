# Start ssh agent and add key
if [ -z "$SSH_AUTH_SOCK" ]; then
  eval "$(ssh-agent -s)"
  ssh-add ~/.ssh/id_ed25519
fi
plugins=(... ssh-agent)
zstyle :omz:plugins:ssh-agent identities ~/.ssh/id_ed25519

# Enable Powerlevel10k
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# load plugin manager (zinit)
ZINIT_HOME="$HOME/.local/share/zinit/zinit.git"
if [ ! -d "$ZINIT_HOME" ]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# reload the zinit
source "${ZINIT_HOME}/zinit.zsh"

# install plugins
zinit ice depth=1; zinit light romkatv/powerlevel10k
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light jeffreytse/zsh-vi-mode

# autoload completions
autoload -U compinit && compinit

# history settings
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase

# options
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# colors for completions
zstyle ':completions:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completions:*' list-colors '${(s.:.)LS_COLORS}'

# source powerlevel 10k config
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh



################
# User section
################

# pyenv path variable
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# nvim path
export PATH="$PATH:/opt/nvim-linux64/bin"
export PATH="$PATH:/opt/nvim-linux64/bin/nvim"

# go path
export PATH="$PATH:$HOME/.local/bin/go/bin"

# fzf path directly to compiled binary
export PATH="$PATH:$HOME/projects/fzf/bin"

# pm path
export PATH="$PATH:$HOME/projects/pm/dist"

# todos path
export PATH="$PATH:$HOME/projects/todos/dist"

# local binaries
export PATH="$PATH:$HOME/.local/bin"

# additional binaries
export PATH="$PATH:/usr/local/sbin"
export PATH="$PATH:/usr/local/bin"
export PATH="$PATH:/usr/sbin"
export PATH="$PATH:/usr/bin"
export PATH="$PATH:/sbin"
export PATH="$PATH:/bin"

export VISUAL=nvim
export EDITOR="$VISUAL"
export NVIM_LISTEN_ADDRESS=/tmp/nvimsocket

alias nvim-server="nvim --listen /tmp/nvimsocket"

# node.js
export FZF_DEFAULT_OPTS='--layout=reverse --border --preview-window=wrap --height=40%'
alias n='jq -r ".scripts | keys[]" package.json | fzf --prompt="Select a script: " | xargs -r npm run'

# git
alias gacp="[ -d .git ] && git add . && git commit && git push origin $([ -d .git ] && git rev-parse --abbrev-ref HEAD)"
alias gs="git status"
alias ga="git add"
alias gaa="git add ."
alias gc="git commit"
alias gd="git diff"
alias gl="git log --decorate --oneline --graph"

# devops
alias ls="ls --color"
alias ll="ls -la"
alias p="xsel --input --clipboard"
alias c="xsel --output --clipboard"
alias vim="nvim"
alias tk="tmux kill-session"
alias tl="tmux list-session"
alias duu="du -h -d 1 | sort -h"
alias aim="~/projects/v0-filemerge/main -config=$HOME/projects/v0-filemerge/config.json"
alias reload="source ~/.zshrc"
alias fm="$HOME/projects/filemanager/dist/fm $(pwd)"
alias gopen='wslview $(git remote get-url origin | sed "s/:/\//" | sed "s/git@/https:\/\//" | sed "s/\.git//")'
alias vault='cd ~/vaults && vim $(find . -maxdepth 1 -mindepth 1 -type d | sed "s|^\./||" | fzf)'
alias godot='/mnt/d/Godot_v4.3-stable_win64.exe/Godot_v4.3-stable_win64.exe'
alias ldk='lazydocker'

# activate zsh extension of fzalias vault='cd ~/vaults && vim $(find . -maxdepth 1 -mindepth 1 -type d | sed "s|^\./||" | fzf)'f
# TODO: isnt this supposed to be in the install script?
eval "$(fzf --zsh)"

# reload fzf zsh extension
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh



export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# bun completions
[ -s "/home/towelie/.bun/_bun" ] && source "/home/towelie/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

