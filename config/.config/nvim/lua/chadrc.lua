-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "kanagawa-dragon",

  -- hl_override = {
  -- 	Comment = { italic = true },
  -- 	["@comment"] = { italic = true },
  -- },
}

M.nvdash = { load_on_startup = false }
M.ui = {
  tabufline = {
    enabled = true,
    lazyload = true,
    order = {"treeOffset", "buffers", "tabs"}
  },
  statusline = {
    theme = "minimal",
    separator_style = "block",
    order = { "mode", "file", "git", "%=", "lsp_msg", "%=", "diagnostics", "lsp", "cwd", "cursor" },
    modules = {
      git = function()
        if not vim.b.gitsigns_head or vim.b.gitsigns_git_status then
          return ""
        end

        local git_status = vim.b.gitsigns_status_dict
        local branch_name = git_status and git_status.head or ""

        if branch_name == "" then
          return ""
        end

        return " " .. " " .. branch_name .. " "
      end,
    },
  },
}

return M
