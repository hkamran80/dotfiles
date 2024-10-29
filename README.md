# Dotfiles

These are my dotfiles for macOS and Linux systems.

## Tools

| Name | Description | Notes |
| -- | -- | -- |
| Zsh | My shell of choice | |
| Git | Version control | |
| Homebrew | Package manager ||
| tmux | Terminal multiplexer ||
| [GNU Stow](https://www.gnu.org/software/stow) | Dotfiles management | Check out [Dreams of Autonomy's video](https://www.youtube.com/watch?v=y6XCebnB9gs) for an excellent guide |
| [fzf](https://github.com/junegunn/fzf) | Fuzzy finder ||
| [Oh My Posh](https://ohmyposh.dev) | Shell prompt ||
| [vivid](https://github.com/sharkdp/vivid) | `LS_COLORS` generator ||
| [zoxide](https://github.com/ajeetdsouza/zoxide) | Smarter `cd` ||
| [btop](https://github.com/aristocratos/btop) | Resource monitor ||
| [ripgrep](https://github.com/BurntSushi/ripgrep) | Recursive directory search ||
| [Neovim](https://neovim.io) | Editor of choice | My favourite Neovim series is [typecraft's Newvim for Newbs](https://www.youtube.com/playlist?list=PLsz00TDipIffreIaUNk64KxTIkQaGguqn) |

## Usage

1. Clone the repository to your home folder

   ```bash
   git clone https://github.com/hkamran80/dotfiles ~/.dotfiles
   ```

2. Install the tools

 This step assumes that Zsh, Git, Homebrew, and tmux are preinstalled.

 ```bash
 brew install fzf oh-my-posh stow vivid zoxide ripgrep neovim
 ```

3. Enter the directory and run `stow .` to create the symlinks

### macOS

- `coreutils` needs to be installed to support `ls` colours via `gls`.
