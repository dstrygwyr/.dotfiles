## Steps to Bootstrap a New Mac

### 1. Install Command Line Tools

Install Apple's Command Line Tools (required for Git and Homebrew):

```zsh
xcode-select --install
```

### 2. Clone This Repository

```zsh
git clone https://github.com/yourusername/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
```

### 3. Install Homebrew and Packages

Install Homebrew:

```zsh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Install all packages from the Brewfile:

```zsh
brew bundle --file ~/.dotfiles/Brewfile
```

### 4. Apply Dotfiles with Stow

Stow creates symlinks from `~/.dotfiles` to your home directory.

#### First Time Setup

To symlink a specific configuration (e.g., nvim):

```zsh
cd ~/.dotfiles
stow config
```

To symlink multiple configurations:

```zsh
cd ~/.dotfiles
stow config zsh git
```

#### Handling Existing Files

If you get a conflict error (files already exist), you have two options:

**Option 1: Backup and remove existing files**

```zsh
# Backup existing config
mkdir -p ~/config_backup
mv ~/.config/nvim ~/config_backup/

# Then run stow again
stow config
```

**Option 2: Adopt existing files (merge into dotfiles)**

```zsh
# This moves existing files into your dotfiles directory and creates symlinks
stow --adopt config

# Review changes (some files might differ from your dotfiles)
git diff

# If you want to keep your dotfiles version, restore them
git restore .
```

#### Removing Symlinks

To remove symlinks created by stow:

```zsh
stow -D config
```

### Troubleshooting

- **"WARNING! stowing X would cause conflicts"**: Files already exist at target locations. Use the backup or adopt method above.
- **"No such file or directory"**: Make sure you're in the `~/.dotfiles` directory when running stow commands.
