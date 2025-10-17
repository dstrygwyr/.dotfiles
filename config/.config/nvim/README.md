# Neovim Configuration

A customized Neovim setup based on NvChad, optimized for modern development workflows.

![Neovim Preview](./preview/Screenshot%202025-10-17%20at%2008.42.35.png)

## Overview

This configuration uses [NvChad](https://github.com/NvChad/NvChad) as a base framework. The main NvChad repository is imported as a plugin, allowing you to extend and customize it while maintaining compatibility with upstream updates.

## Key Features

- Modern LSP integration with enhanced keybindings
- Smart code folding with nvim-ufo
- Telescope fuzzy finder with custom configurations
- Git integration and status indicators
- Autocomplete and snippets support
- Custom theme and UI enhancements

## Structure

This repo follows NvChad's modular pattern:
- Import NvChad modules: `require "nvchad.options"`, `require "nvchad.mappings"`
- Override and extend in `lua/` directory
- Custom plugins in `lua/plugins/`
- Keymappings in `lua/mappings.lua`

## Installation

1. Clone this configuration:
   ```bash
   git clone <your-repo-url> ~/.config/nvim
   cd ~/.config/nvim
   rm -rf .git  # Optional: remove git history to start fresh
   ```

2. Launch Neovim:
   ```bash
   nvim
   ```

3. Let lazy.nvim install all plugins automatically.

## Credits

- [NvChad](https://github.com/NvChad/NvChad) - Base framework
- [LazyVim starter](https://github.com/LazyVim/starter) - Inspiration for NvChad's starter structure
