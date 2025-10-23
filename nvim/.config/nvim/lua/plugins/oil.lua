return {
  {
    "stevearc/oil.nvim",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      default_file_explorer = true,
      columns = {
        "icon",
      },
      view_options = {
        show_hidden = true,
      },
      float = {
        padding = 2,
        max_width = 90,
        max_height = 0,
        border = "rounded",
      },
      keymaps = {
        ["q"] = "actions.close",
      },
    },
    keys = {
      { "-", "<cmd>Oil<cr>", desc = "Open parent directory" },
      { "<leader>e", "<cmd>Oil<cr>", desc = "Open file explorer" },
      { "<leader>E", "<cmd>Oil --float<cr>", desc = "Open file explorer (float)" },
    },
    config = function(_, opts)
      require("oil").setup(opts)
      
      -- Open oil.nvim on startup if no files were opened
      vim.api.nvim_create_autocmd("VimEnter", {
        callback = function()
          if vim.fn.argc() == 0 then
            require("oil").open()
          end
        end,
      })
    end,
  },
}
