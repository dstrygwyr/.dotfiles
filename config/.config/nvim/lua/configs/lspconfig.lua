require("nvchad.configs.lspconfig").defaults()

-- List of language servers to enable
local servers = {
  "html",           -- HTML
  "cssls",          -- CSS
  "ts_ls",          -- TypeScript/JavaScript (typescript-language-server)
  "tailwindcss",    -- Tailwind CSS
  "gopls",          -- Go
  "rust_analyzer",  -- Rust
  "lua_ls",         -- Lua
  "intelephense",   -- PHP
  "zls",            -- Zig
  "emmet_ls",       -- Emmet
  "dockerls",       -- Docker
  "docker_compose_language_service", -- Docker Compose
}

-- Enable all language servers
vim.lsp.enable(servers)

-- Optional: Configure specific servers
vim.lsp.config.lua_ls = {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          vim.fn.expand("$VIMRUNTIME/lua"),
          vim.fn.expand("$VIMRUNTIME/lua/vim/lsp"),
          vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy",
        },
        maxPreload = 100000,
        preloadFileSize = 10000,
      },
    },
  },
}

