-- Use NvChad theme colors via base46
local colors = require("base46").get_theme_tb "base_30"

local function get_lualine_theme()
  return {
    normal = {
      a = { fg = colors.black, bg = colors.green },
      b = { fg = colors.green, bg = colors.one_bg },
      c = { fg = colors.grey_fg, bg = colors.one_bg },
    },
    insert = { a = { fg = colors.black, bg = colors.blue, gui = "bold" } },
    visual = { a = { fg = colors.black, bg = colors.cyan } },
    replace = { a = { fg = colors.black, bg = colors.red } },
    inactive = {
      a = { fg = colors.light_grey, bg = colors.one_bg },
      b = { fg = colors.light_grey, bg = colors.one_bg },
      c = { fg = colors.light_grey, bg = colors.one_bg },
    },
  }
end

require("lualine").setup {
  options = {
    theme = get_lualine_theme(),
    component_separators = "|",
    section_separators = "",
    disabled_filetypes = {
      statusline = { "alpha", "NvimTree", "trouble", "Outline" },
    },
    globalstatus = true,
  },
  sections = {
    lualine_a = {
      {
        "mode",
        fmt = function(str)
          local mode_map = {
            ["NORMAL"] = "NR",
            ["INSERT"] = "IN",
            ["VISUAL"] = "VV",
            ["V-LINE"] = "VL",
            ["V-BLOCK"] = "VB",
            ["REPLACE"] = "RP",
            ["COMMAND"] = "CM",
            ["TERMINAL"] = "TR",
            ["SELECT"] = "SL",
          }
          return mode_map[str] or str:sub(1, 1)
        end,
      },
    },
    lualine_b = {
      "branch",
      "diff",
      {
        "diagnostics",
        sources = { "nvim_lsp", "nvim_diagnostic" },
        symbols = { error = " ", warn = " ", info = " ", hint = " " },
      },
    },
    lualine_c = {
      {
        "filename",
        path = 1,
        shorting_target = 40,
        symbols = {
          modified = "[+]",
          readonly = "[-]",
          unnamed = "[No Name]",
        },
      },
    },
    lualine_x = { "filetype" },
    lualine_y = {},
    lualine_z = { { "os.date('󰅐 %H:%M')" } },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { "filename" },
    lualine_x = { "location" },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = { "nvim-tree", "lazy", "mason" },
}
