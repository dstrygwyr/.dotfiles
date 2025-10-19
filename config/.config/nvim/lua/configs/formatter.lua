local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    javascript = { "biome" },
    typescript = { "biome" },
    javascriptreact = { "biome" },
    typescriptreact = { "biome" },
    json = { "biome" },
    jsonc = { "biome" },
    css = { "biome" },
    html = { "prettier" },
    yaml = { "prettier" },
    markdown = { "prettier" },
    go = { "gofmt", "goimports" },
    rust = { "rustfmt" },
    php = { "php_cs_fixer" },
    zig = { "zigfmt" },
    sh = { "shfmt" },
    bash = { "shfmt" },
  },

  -- Format on save (optional - uncomment to enable)
  -- format_on_save = {
  --   timeout_ms = 500,
  --   lsp_fallback = true,
  -- },
}

return options
