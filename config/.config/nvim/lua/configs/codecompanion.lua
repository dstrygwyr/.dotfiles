return {
  adapters = {
    acp = {
      claude_code = function()
        return require("codecompanion.adapters").extend("claude_code", {
          env = {
            -- You can set your authentication here
            -- For OAuth token (if you have Claude Pro):
            -- CLAUDE_CODE_OAUTH_TOKEN = "your-oauth-token",

            -- Or for API key:
            -- ANTHROPIC_API_KEY = "your-api-key",

            -- Or use environment variables (recommended):
            -- ANTHROPIC_API_KEY = "ANTHROPIC_API_KEY",
          },
        })
      end,
    },
  },
  strategies = {
    chat = {
      adapter = "claude_code",
    },
    inline = {
      adapter = "copilot",
    },
    cmd = {
      adapter = "claude_code",
    },
  },
  display = {
    action_palette = {
      width = 95,
      height = 10,
      provider = "snacks",
    },
    chat = {
      window = {
        layout = "vertical",      -- float|vertical|horizontal|buffer
        position = nil,           -- left|right|top|bottom
        border = "single",
        height = 0.8,
        width = 0.45,
        relative = "editor",
        full_height = true,
        sticky = false,
        opts = {
          breakindent = true,
          cursorcolumn = false,
          cursorline = false,
          foldcolumn = "0",
          linebreak = true,
          list = false,
          numberwidth = 1,
          signcolumn = "no",
          spell = false,
          wrap = true,
        },
      },
      intro_message = "Welcome to CodeCompanion ✨! Press ? for options",
      separator = "─",
      show_context = true,
      show_header_separator = false,
      show_settings = false,
      show_token_count = true,
      show_tools_processing = true,
      start_in_insert_mode = false,
      auto_scroll = false,
      icons = {
        buffer_pin = " ",
        buffer_watch = "👀 ",
        chat_context = "📎️",
        chat_fold = " ",
      },
      token_count = function(tokens, adapter)
        return " (" .. tokens .. " tokens)"
      end,
    },
  },
  opts = {
    log_level = "INFO", -- Change to "DEBUG" for troubleshooting
  },
}
