return {
  progress = {
    poll_rate = 0.5,
    suppress_on_insert = false,
    ignore_done_already = false,
    ignore_empty_message = false,
    notification_group = function(msg)
      return msg.lsp_client.name
    end,
    display = {
      render_limit = 16,
      done_ttl = 3,
      done_icon = "✓",
      done_style = "Constant",
      progress_ttl = math.huge,
      -- Custom braille spinner animation
      progress_icon = { 
        pattern = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }, 
        period = 1 
      },
      progress_style = "WarningMsg",
      group_style = "Title",
      icon_style = "Question",
      priority = 30,
      skip_history = true,
      format_message = function(msg)
        if msg.message then
          return msg.message
        else
          return msg.done and "Completed" or "In progress..."
        end
      end,
      format_annote = function(msg)
        return msg.title
      end,
      format_group_name = function(group)
        return tostring(group)
      end,
      overrides = {
        rust_analyzer = { name = "rust-analyzer" },
      },
    },
  },
  notification = {
    poll_rate = 10,
    filter = vim.log.levels.INFO,
    history_size = 128,
    override_vim_notify = false,
    window = {
      normal_hl = "Comment",
      winblend = 0,
      border = "none",
      zindex = 45,
      max_width = 0,
      max_height = 0,
      x_padding = 1,
      y_padding = 0,
      align = "bottom",
      relative = "editor",
    },
  },
  integration = {
    ["nvim-tree"] = {
      enable = true,
    },
  },
  logger = {
    level = vim.log.levels.WARN,
    float_precision = 0.01,
    path = string.format("%s/fidget.nvim.log", vim.fn.stdpath("cache")),
  },
}
