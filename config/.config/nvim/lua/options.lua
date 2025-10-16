require "nvchad.options"

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
--
--

require("nvim-tree").setup {
  sync_root_with_cwd = true,
  respect_buf_cwd = true,
  update_focused_file = { enable = true, update_cwd = true },
}
