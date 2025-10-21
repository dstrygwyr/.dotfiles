-- Fidget.nvim progress integration for CodeCompanion
local spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }

local progress = require("fidget.progress")
local M = {}

M.handles = {}

function M:init()
  local group = vim.api.nvim_create_augroup("CodeCompanionFidgetHooks", { clear = true })

  vim.api.nvim_create_autocmd({ "User" }, {
    pattern = "CodeCompanionRequestStarted",
    group = group,
    callback = function(request)
      local handle = M:create_progress_handle(request)
      M:store_progress_handle(request.data.id, handle)
    end,
  })

  vim.api.nvim_create_autocmd({ "User" }, {
    pattern = "CodeCompanionRequestFinished",
    group = group,
    callback = function(request)
      local handle = M:pop_progress_handle(request.data.id)
      if handle then
        M:report_exit_status(handle, request)
        handle:finish()
      end
    end,
  })
end

function M:store_progress_handle(id, handle)
  M.handles[id] = handle
end

function M:pop_progress_handle(id)
  local handle = M.handles[id]
  M.handles[id] = nil
  return handle
end

function M:create_progress_handle(request)
  local adapter = request.data.adapter
  local strategy = request.data.strategy or "chat"
  local model = adapter and adapter.schema and adapter.schema.model and adapter.schema.model.default or "unknown"
  
  return progress.handle.create({
    title = string.format("CodeCompanion (%s)", strategy),
    message = string.format("%s - %s", adapter and adapter.name or "AI", model),
    lsp_client = { name = "CodeCompanion" },
  })
end

function M:report_exit_status(handle, request)
  if request.data.status == "success" then
    handle:report({
      message = "✓ Completed",
    })
  else
    handle:report({
      message = string.format("✗ Failed: %s", request.data.error or "Unknown error"),
    })
  end
end

return M
