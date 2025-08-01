## User Configuration Files
ALIASES_FILE="${HOME}/.aliasesrc"
PATH_FILE="${HOME}/.pathrc"
EXPORTS_FILE="${HOME}/.exportsrc"
PROGRAMS_FILE="${HOME}/.programsrc"

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
zinit snippet OMZP::asdf

## Completions
autoload -Uz compinit && compinit
zinit cdreplay -q

## Keybindings
zinit snippet OMZL::key-bindings.zsh

## History
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=9000
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

export PATH="$HOME/.bin:$PATH"

if [[ -f "$PATH_FILE" ]]; then
    source $PATH_FILE
fi

## Aliases
if [[ "$OSTYPE" == "darwin"* ]]; then
	alias ls='gls --color'
	alias stty=/bin/stty
else
	alias ls='ls --color'
fi

if [[ -f "$ALIASES_FILE" ]]; then
    source $ALIASES_FILE
fi

## Exports
if [[ -f "$EXPORTS_FILE" ]]; then
    source $EXPORTS_FILE
fi

## Programs
if [[ -f "$PROGRAMS_FILE" ]]; then
    source $PROGRAMS_FILE
fi

## Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"

if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
	eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/omp.yaml)"
fi
