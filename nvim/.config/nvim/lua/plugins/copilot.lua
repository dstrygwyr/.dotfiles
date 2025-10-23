return {
  "github/copilot.vim",
  event = "InsertEnter",
  config = function()
    -- Copilot keybindings
    vim.g.copilot_no_tab_map = true
    vim.g.copilot_assume_mapped = true
    
    -- Accept suggestion with Ctrl+J
    vim.keymap.set("i", "<C-J>", 'copilot#Accept("\\<CR>")', {
      expr = true,
      replace_keycodes = false,
      silent = true,
    })
    
    -- Navigate between suggestions
    vim.keymap.set("i", "<C-]>", "<Plug>(copilot-next)", { silent = true })
    vim.keymap.set("i", "<C-[>", "<Plug>(copilot-previous)", { silent = true })
    
    -- Dismiss suggestion
    vim.keymap.set("i", "<C-\\>", "<Plug>(copilot-dismiss)", { silent = true })
  end,
}
