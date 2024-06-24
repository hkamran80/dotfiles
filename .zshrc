## Homebrew
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
	eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
elif [[ "$OSTYPE" == "darwin"* ]]; then
	eval "$(/usr/local/bin/brew shellenv)"
fi

## zinit
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"

## Plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

## Snippets
zinit snippet OMZP::sudo
zinit snippet OMZP::command-not-found
zinit snippet OMZL::directories.zsh

## Completions
autoload -Uz compinit && compinit
zinit cdreplay -q

## Keybindings
zinit snippet OMZL::key-bindings.zsh

## History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt append_history
setopt share_history
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

## Styling
export LS_COLORS="$(vivid generate gruvbox-dark-hard)"

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
if [[ "$OSTYPE" == "darwin"* ]]; then
	zstyle ':fzf-tab:complete:cd:*' fzf-preview 'gls --color $realpath'
	zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'gls --color $realpath'
else
	zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
	zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'
fi

## Path
if [[ "$OSTYPE" == "darwin"* ]]; then
	export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
fi

export PATH="~/.bin:$PATH"

## Aliases
if [[ "$OSTYPE" == "darwin"* ]]; then
	alias ls='gls --color'
else
	alias ls='ls --color'
fi

## Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"

if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
	eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/omp.yaml)"
fi
