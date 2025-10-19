require("nvchad.configs.lspconfig").defaults()

-- Biome LSP for JavaScript/TypeScript formatting and linting
vim.lsp.config.biome = {
  cmd = { vim.fn.stdpath "data" .. "/mason/bin/biome", "lsp-proxy" },
  filetypes = {
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "json",
    "jsonc",
    "css",
    "astro",
    "svelte",
    "vue",
  },
  root_markers = { "biome.json", "biome.jsonc", "package.json", ".git" },
  single_file_support = true,
  on_attach = function(client, bufnr)
    -- Optional: Enable formatting on save with Biome LSP
    -- vim.api.nvim_create_autocmd("BufWritePre", {
    --   buffer = bufnr,
    --   callback = function()
    --     vim.lsp.buf.format({ async = false })
    --   end,
    -- })
  end,
}

vim.lsp.enable('biome')
