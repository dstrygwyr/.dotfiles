require "nvchad.options"

-- add yours here!

local o = vim.o
o.cursorlineopt = 'both' -- to enable cursorline!

-- UFO folding settings
o.foldcolumn = "0"    -- Hide fold column
o.foldlevel = 99      -- Using ufo provider need a large value
o.foldlevelstart = 99 -- Expand all folds by default
o.foldenable = true   -- Enable folding

require("nvim-tree").setup {
  sync_root_with_cwd = true,
  respect_buf_cwd = true,
  update_focused_file = { enable = true, update_cwd = true },
}
