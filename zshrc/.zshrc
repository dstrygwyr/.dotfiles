# ─── Oh My Zsh Configuration ────────────────────────────────────────────────
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
source $ZSH/oh-my-zsh.sh

# ─── Load Custom Aliases ────────────────────────────────────────────────────
[ -f ~/.zshrc_aliases ] && source ~/.zshrc_aliases

# ─── Starship Prompt ────────────────────────────────────────────────────────
eval "$(starship init zsh)"

# ─── Path Configuration ─────────────────────────────────────────────────────
export PATH="/opt/homebrew/opt/trash/bin:$PATH"
export PATH="/opt/homebrew/opt/postgresql@17/bin:$PATH"
export PATH="/Users/strygwyr/.bun/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"
export GOBIN="$HOME/.asdf/shims"

# ─── ASDF Version Manager (Homebrew) ────────────────────────────────────────
. $(brew --prefix asdf)/libexec/asdf.sh
# ─── Zsh Plugins ────────────────────────────────────────────────────────────
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# ─── Docker CLI Completion ──────────────────────────────────────────────────
fpath=(/Users/strygwyr/.docker/completions $fpath)
autoload -Uz compinit
compinit

[[ -s "/Users/strygwyr/.gvm/scripts/gvm" ]] && source "/Users/strygwyr/.gvm/scripts/gvm"

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"
# Source local config (not tracked by git)
[ -f ~/.zshrc.local ] && source ~/.zshrc.local
