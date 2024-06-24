# Dotfiles

For a guide on GNU Stow, check out [the video by Dreams of Autonomy](https://www.youtube.com/watch?v=y6XCebnB9gs).

## Requirements

- Zsh
- Git
- Homebrew
- fzf
- Oh My Posh
- GNU Stow
- tmux
- vivid
- zoxide

## Configuration

- Zsh
- micro
- Oh My Posh
- tmux
- `LS_COLORS`

## Usage

1. Clone the repository to your home folder using Git
2. Install the requirements

	```bash
	brew install fzf oh-my-posh stow vivid zoxide
	```

	On macOS, install `coreutils` as well: `brew install coreutils`

3. Enter the directory and run `stow .` to create the symlinks
