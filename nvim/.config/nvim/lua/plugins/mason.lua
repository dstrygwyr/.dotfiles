return {
  {
    "mason-org/mason.nvim",
    opts = {
      ui = {
        border = "rounded",
      },
      ensure_installed = {
        -- LSP Servers
        "lua-language-server",
        "typescript-language-server",
        "html-lsp",
        "css-lsp",
        "json-lsp",
        "tailwindcss-language-server",
        "vue-language-server",
        "rust-analyzer",
        "python-lsp-server",
        "intelephense",
        "prisma-language-server",
        "yaml-language-server",
        "docker-language-server",
        "docker-compose-language-service",
        "zls",
        
        -- Formatters & Linters
        "stylua",
        "shfmt",
        "htmlhint",
        "sql-formatter",
        "biome",
        
        -- Tools
        "tree-sitter-cli",
        "postgrestools",
      },
    },
  },

  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      automatic_installation = true,
    },
  },
}
