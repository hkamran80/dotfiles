# Dotfiles

For a guide on GNU Stow, check out [the video by Dreams of Autonomy](https://www.youtube.com/watch?v=y6XCebnB9gs).

## Requirements

- Zsh
- Git
- Homebrew
- [fzf](https://github.com/junegunn/fzf)
- [Oh My Posh](https://ohmyposh.dev)
- [GNU Stow](https://www.gnu.org/software/stow)
- tmux
- [vivid](https://github.com/sharkdp/vivid)
- [zoxide](https://github.com/ajeetdsouza/zoxide)
- [btop](https://github.com/aristocratos/btop)
- [ripgrep](https://github.com/BurntSushi/ripgrep)

## Configuration

- Zsh
- [micro](https://github.com/zyedidia/micro)
- Oh My Posh
- tmux
- `LS_COLORS`
- btop
- Hyper
- Neovim

## Usage

1. Clone the repository to your home folder

   ```bash
   git clone https://github.com/hkamran80/dotfiles .dotfiles
   ```

2. Install the requirements

	```bash
	brew install fzf oh-my-posh stow vivid zoxide ripgrep neovim
	```

3. Enter the directory and run `stow .` to create the symlinks

### macOS

- `coreutils` needs to be installed to support `ls` colours via `gls`.
