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

# Extend Path variables
export PATH="$PATH:/opt/nvim-linux64/bin"
export PATH="$PATH:/opt/nvim-linux64/bin/nvim"
export PATH="$PATH:$HOME/.local/bin/go/bin"
export PATH="$PATH:$HOME/projects/fzf/bin"
export PATH="$PATH:$HOME/projects/pm/dist"
export PATH="$PATH:$HOME/projects/todos/dist"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:/usr/local/sbin"
export PATH="$PATH:/usr/local/bin"
export PATH="$PATH:/usr/sbin"
export PATH="$PATH:/usr/bin"
export PATH="$PATH:/sbin"
export PATH="$PATH:/bin"

export VISUAL=nvim
export EDITOR="$VISUAL"
export NVIM_LISTEN_ADDRESS=/tmp/nvimsocket


# Program alias
alias gs="git status"
alias ga="git add"
alias gaa="git add ."
alias gc="git commit"
alias gd="git diff"
alias gl="git log --decorate --oneline --graph"
alias nvim-server="nvim --listen /tmp/nvimsocket"
alias ls="ls --color"
alias ll="ls -la"
alias p="xsel --input --clipboard"
alias c="xsel --output --clipboard"
alias vim="nvim"
alias tk="tmux kill-session"
alias tl="tmux list-session"
alias duu="du -h -d 1 | sort -h"
alias fm="$HOME/projects/filemanager/dist/fm $(pwd)"
alias ldk='lazydocker'

# Command alias
alias aim="~/projects/v0-filemerge/main -config=$HOME/projects/v0-filemerge/config.json"
alias gacp="[ -d .git ] && git add . && git commit && git push origin $([ -d .git ] && git rev-parse --abbrev-ref HEAD)"
alias godot='/mnt/d/Godot_v4.3-stable_win64.exe/Godot_v4.3-stable_win64.exe'
alias gopen='wslview $(git remote get-url origin | sed "s/:/\//" | sed "s/git@/https:\/\//" | sed "s/\.git//")'
alias n='jq -r ".scripts | keys[]" package.json | fzf --prompt="Select a script: " | xargs -r npm run'
alias reload="source ~/.zshrc"
alias stop_all_docker='docker ps -aq | xargs docker stop'
alias vaults='cd $(find ~/vaults/ -maxdepth 1 -mindepth 1 -type d | sed "s|^\./||" | fzf) && vim'


# Fzf (Fuzzy Finder)
export FZF_DEFAULT_OPTS='--layout=reverse --border --preview-window=wrap --height=40%'
eval "$(fzf --zsh)"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


# Bun (JavaScript Runtime)
[ -s "/home/towelie/.bun/_bun" ] && source "/home/towelie/.bun/_bun"
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Nvm (Node Version Manager)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

unalias sssh 2>/dev/null

sssh() {
    if [ $# -eq 0 ]; then
        # Extract host names from SSH config file
        # Remove comments, empty lines, and get only Host lines
        # Exclude wildcards and patterns (lines containing * or ?)
        host=$(grep "^Host " ~/.ssh/config | 
               grep -v "[*?]" | 
               sed 's/Host //' | 
               tr ' ' '\n' | 
               fzf --height 40% --reverse)
        
        if [ -n "$host" ]; then
            # If a host was selected, connect with X11 forwarding
            command ssh -X "$host"
        fi
    else
        # If arguments were provided, pass them through to ssh
        command ssh "$@"
    fi
}

alias sssh="sssh"
