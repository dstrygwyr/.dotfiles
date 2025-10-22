-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

-- Disable base46 theme since we're using Kanso
-- M.base46 = {
--   theme = "onedark",
-- }

M.nvdash = { load_on_startup = false }
-- Disable Telescope (using Snacks instead)
M.ui = {
  telescope = { enabled = false },
  tabufline = {
    enabled = true,
    lazyload = true,
    order = { "treeOffset", "buffers", "tabs" },
  },
  statusline = {
    enabled = false,
    theme = "minimal",
    separator_style = "block",
    order = { "mode", "file", "git", "%=", "lsp_msg", "%=", "diagnostics", "lsp", "cwd", "cursor" },
  },
}

return M

