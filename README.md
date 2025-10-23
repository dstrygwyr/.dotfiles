# Dotfiles

Personal configuration files for development environment setup.

> **Note:** Some configurations are optimized for macOS and may require adjustments for other operating systems.

## What's Included

- **nvim** - Neovim configuration with plugins and themes
- **zsh** - Shell configuration
- **tmux** - Terminal multiplexer configuration
- **ghostty** - Terminal emulator themes and config
- **zed** - Code editor themes and settings
- **lazygit** - Git TUI configuration
- **github-copilot** - GitHub Copilot CLI configuration
- **gitconfig** - Git configuration

## Installation

Uses [GNU Stow](https://www.gnu.org/software/stow/) for symlink management.

> **Important:** Before running the installation scripts, make them executable:
> ```bash
> chmod +x stow install
> ```

### Quick Setup

```bash
./stow
```

### Manual Installation

```bash
# Set environment variables (optional)
export DOTFILES=$HOME/.dotfiles
export STOW_FOLDERS="tmux,zsh,nvim,ghostty,zed,lazygit,github-copilot,gitconfig"

# Run install script
./install
```

The install script will:

1. Remove any existing symlinks for each package
2. Create fresh symlinks to your home directory

## Structure

Each directory represents a package that can be independently stowed:

```
.dotfiles/
├── ghostty/          # Terminal emulator
├── github-copilot/   # GitHub Copilot CLI
├── gitconfig/        # Git configuration
├── lazygit/          # Git TUI
├── nvim/             # Neovim editor
├── tmux/             # Terminal multiplexer
├── zed/              # Code editor
└── zsh/              # Shell
```

## Customization

Modify the `STOW_FOLDERS` variable in the `stow` script to install only specific packages:

```bash
STOW_FOLDERS="nvim,tmux,zsh" ./stow
```
