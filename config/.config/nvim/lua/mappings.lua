require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
local Snacks = require("snacks")

-- Remove annoying <leader>n keymaps
vim.keymap.del("n", "<leader>n")

-- Window Navigation
map("n", "<C-h>", "<C-w>h", { desc = "Switch window left" })
map("n", "<C-l>", "<C-w>l", { desc = "Switch window right" })
map("n", "<C-j>", "<C-w>j", { desc = "Switch window down" })
map("n", "<C-k>", "<C-w>k", { desc = "Switch window up" })

-- General
map("n", "<Esc>", "<cmd>noh<CR>", { desc = "Clear highlights" })
map("n", "<C-s>", "<cmd>w<CR>", { desc = "Save file" })
map("n", "<C-c>", "<cmd>%y+<CR>", { desc = "Copy whole file" })
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jj", "<ESC>", { desc = "Exit insert mode" })
map("n", "<leader>ch", "<cmd>NvCheatsheet<CR>", { desc = "Toggle nvcheatsheet" })

-- Format with Biome (includes class sorting)
map({ "n", "x" }, "<leader>fm", function()
  local bufnr = vim.api.nvim_get_current_buf()
  local filename = vim.api.nvim_buf_get_name(bufnr)
  local filetype = vim.bo.filetype

  -- Check if it's a filetype that Biome handles
  local biome_filetypes = {
    javascript = true,
    javascriptreact = true,
    typescript = true,
    typescriptreact = true,
    json = true,
    jsonc = true,
    css = true,
  }

  if biome_filetypes[filetype] and filename ~= "" then
    -- Run biome check with --write for Biome-supported files
    vim.fn.jobstart({ "biome", "check", "--write", "--unsafe", filename }, {
      on_exit = function(_, exit_code)
        if exit_code == 0 then
          vim.cmd("checktime") -- Reload the file
        else
          vim.notify("Biome: Check failed", vim.log.levels.ERROR)
        end
      end,
    })
  else
    -- Fall back to conform for other file types
    require("conform").format { lsp_fallback = true }
  end
end, { desc = "Format file" })

-- Global LSP mappings
map("n", "<leader>ds", vim.diagnostic.setloclist, { desc = "LSP diagnostic loclist" })

-- Tabufline (Buffer Navigation)
map("n", "<leader>b", "<cmd>enew<CR>", { desc = "New buffer" })
map("n", "<C-]>", function()
  require("nvchad.tabufline").next()
end, { desc = "Goto next buffer" })
map("n", "<C-[>", function()
  require("nvchad.tabufline").prev()
end, { desc = "Goto prev buffer" })
map("n", "<leader>x", function()
  require("nvchad.tabufline").close_buffer()
end, { desc = "Close buffer" })

-- Comment
map("n", "<leader>/", "gcc", { desc = "Toggle comment", remap = true })
map("v", "<leader>/", "gc", { desc = "Toggle comment", remap = true })

-- NvimTree
map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
map("n", "<leader>e", "<cmd>NvimTreeFocus<CR>", { desc = "Focus file explorer" })

-- Snacks Picker
map("n", "<leader>fw", function() Snacks.picker.grep() end, { desc = "Live grep" })
map("n", "<leader>fb", function() Snacks.picker.buffers() end, { desc = "Find buffers" })
map("n", "<leader>fh", function() Snacks.picker.help() end, { desc = "Help page" })
map("n", "<leader>ma", function() Snacks.picker.marks() end, { desc = "Find marks" })
map("n", "<leader>fo", function() Snacks.picker.recent() end, { desc = "Find oldfiles" })
map("n", "<leader>fz", function() Snacks.picker.grep_bufword() end, { desc = "Find in current buffer" })
map("n", "<leader>cm", function() Snacks.picker.git_log() end, { desc = "Git commits" })
map("n", "<leader>gt", function() Snacks.picker.git_status() end, { desc = "Git status" })
map("n", "<leader>pt", "<cmd>Telescope terms<CR>", { desc = "Pick hidden term" })
map("n", "<leader>th", function()
  require("nvchad.themes").open()
end, { desc = "NvChad themes" })
map("n", "<leader>ff", function() Snacks.picker.files() end, { desc = "Find files" })
map("n", "<leader>fa", function() Snacks.picker.files({ hidden = true, no_ignore = true }) end,
  { desc = "Find all files" })

-- Snacks LSP Symbol Search
map("n", "gs", function() Snacks.picker.lsp_symbols() end, { desc = "Find symbols in document" })
map("n", "gS", function() Snacks.picker.lsp_workspace_symbols() end, { desc = "Find symbols in workspace" })
map("n", "<leader>fr", function() Snacks.picker.lsp_references() end, { desc = "Find references" })

-- Terminal
map("t", "<Esc><Esc>", "<C-\\><C-N>", { desc = "Escape terminal mode" })
map("t", "<C-q>", "<C-\\><C-N>:bd!<CR>", { desc = "Close terminal" })

-- Toggle terminals (with custom size)
map("n", "<leader>h", function()
  require("nvchad.term").toggle { pos = "sp", id = "htoggleTerm", size = 0.3 }
end, { desc = "Toggle horizontal term" })

map("n", "<leader>v", function()
  -- Switch to the last accessed normal window before opening terminal
  if vim.bo.filetype == "NvimTree" then
    vim.cmd "wincmd p"
  end
  require("nvchad.term").toggle { pos = "vsp", id = "vtoggleTerm", size = 0.3 }
end, { desc = "Toggle vertical term" })

-- Toggleable terminals
map({ "n", "t" }, "<A-v>", function()
  -- Switch to the last accessed normal window before opening terminal
  if vim.bo.filetype == "NvimTree" then
    vim.cmd "wincmd p"
  end
  require("nvchad.term").toggle { pos = "vsp", id = "vtoggleTerm" }
end, { desc = "Toggleable vertical term" })

map({ "n", "t" }, "<A-h>", function()
  require("nvchad.term").toggle { pos = "sp", id = "htoggleTerm" }
end, { desc = "Toggleable horizontal term" })

map({ "n", "t" }, "<A-i>", function()
  require("nvchad.term").toggle { pos = "float", id = "floatTerm" }
end, { desc = "Toggle floating term" })

-- Alternative floating terminal keymap (more reliable on macOS)
map("n", "<leader>ft", function()
  require("nvchad.term").toggle { pos = "float", id = "floatTerm" }
end, { desc = "Toggle floating term" })

-- WhichKey
map("n", "<leader>wK", "<cmd>WhichKey <CR>", { desc = "Whichkey all keymaps" })
map("n", "<leader>wk", function()
  vim.cmd("WhichKey " .. vim.fn.input "WhichKey: ")
end, { desc = "Whichkey query lookup" })

-- Better Copy/Paste
map("v", "p", '"_dP', { desc = "Paste without yanking" })
map({ "n", "v" }, "<leader>y", '"+y', { desc = "Yank to system clipboard" })
map("n", "<leader>Y", '"+Y', { desc = "Yank line to system clipboard" })
map({ "n", "v" }, "<leader>pp", '"+p', { desc = "Paste from system clipboard" })
map({ "n", "v" }, "<leader>d", '"_d', { desc = "Delete without yanking" })

-- Text Editing
map("v", "<", "<gv", { desc = "Indent left and reselect" })
map("v", ">", ">gv", { desc = "Indent right and reselect" })

-- Search and Replace
map("n", "<leader>sr", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>", { desc = "Search and replace word" })
map("n", "n", "nzzzv", { desc = "Next search result (centered)" })
map("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })

-- LSP mappings
map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", { desc = "Go to definition" })
map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", { desc = "Go to declaration" })
map("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", { desc = "Go to references" })
map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", { desc = "Go to implementation" })
map("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", { desc = "Hover documentation" })
map("n", "gh", "<cmd>lua vim.lsp.buf.hover()<cr>", { desc = "Hover documentation" })
map("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>", { desc = "Previous diagnostic" })
map("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>", { desc = "Next diagnostic" })
map("n", "<leader>do", "<cmd>lua vim.diagnostic.open_float()<cr>", { desc = "Open diagnostic float" })
map("n", "<leader>dl", function() Snacks.picker.diagnostics() end, { desc = "List all diagnostics" })

-- Git (Gitsigns)
map("n", "<leader>gp", "<cmd>Gitsigns preview_hunk<cr>", { desc = "Preview git hunk" })
map("n", "<leader>gb", "<cmd>Gitsigns blame_line<cr>", { desc = "Git blame line" })
map("n", "[c", "<cmd>Gitsigns prev_hunk<cr>", { desc = "Previous git hunk" })
map("n", "]c", "<cmd>Gitsigns next_hunk<cr>", { desc = "Next git hunk" })

-- Lazygit
map("n", "<leader>gg", "<cmd>LazyGit<cr>", { desc = "Open LazyGit" })

-- UFO Folding
map("n", "zR", function() require("ufo").openAllFolds() end, { desc = "Open all folds" })
map("n", "zM", function() require("ufo").closeAllFolds() end, { desc = "Close all folds" })
map("n", "zr", function() require("ufo").openFoldsExceptKinds() end, { desc = "Fold less" })
map("n", "zm", function() require("ufo").closeFoldsWith() end, { desc = "Fold more" })
map("n", "zp", function() require("ufo").peekFoldedLinesUnderCursor() end, { desc = "Peek fold" })

-- Markdown Preview
map("n", "<leader>mt", "<cmd>Markview Toggle<cr>", { desc = "Toggle markdown preview" })
map("n", "<leader>mp", "<cmd>Markview Enable<cr>", { desc = "Enable markdown preview" })
map("n", "<leader>ms", "<cmd>Markview Disable<cr>", { desc = "Disable markdown preview" })
map("n", "<leader>mh", "<cmd>Markview HybridToggle<cr>", { desc = "Toggle hybrid mode" })
map("n", "<leader>mv", "<cmd>Markview splitToggle<cr>", { desc = "Toggle split view" })

-- Miscellaneous
map("n", "<leader>uu", "<cmd>Lazy update<cr>", { desc = "Update plugins" })
map("n", "<leader>um", "<cmd>Mason<cr>", { desc = "Mason (LSP installer)" })

-- CodeCompanion (AI Assistant)
map({ "n", "v" }, "<leader>ca", "<cmd>CodeCompanionActions<cr>", { desc = "AI Action Palette" })
map({ "n", "v" }, "<leader>cc", "<cmd>CodeCompanionChat Toggle<cr>", { desc = "AI Toggle Chat" })
map("n", "<leader>co", "<cmd>CodeCompanionChat<cr>", { desc = "AI Open Chat" })
map("v", "<leader>ca", "<cmd>CodeCompanionChat Add<cr>", { desc = "AI Add to Chat" })
map({ "n", "v" }, "<leader>ci", "<cmd>CodeCompanion<cr>", { desc = "AI Inline Assistant" })
map("n", "<leader>cm", "<cmd>CodeCompanionCmd<cr>", { desc = "AI Generate Command" })

-- Expand 'cc' into 'CodeCompanion' in the command line
vim.cmd([[cab cc CodeCompanion]])
