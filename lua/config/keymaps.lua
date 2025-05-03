-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.api.nvim_set_keymap("i", "kd", "<ESC>A", { silent = true })

vim.api.nvim_create_user_command("EscapeDelimiter", function()
  local delimiters = { ["("] = ")", ["["] = "]", ["{"] = "}", ['"'] = '"', ["'"] = "'", ["`"] = "`" }
  local line = vim.api.nvim_get_current_line()
  local cursor_col = vim.api.nvim_win_get_cursor(0)[2]
  local line_after_cursor = line:sub(cursor_col + 1)

  -- Find the nearest closing delimiter
  local min_pos = nil

  for _, char in pairs(delimiters) do
    local pos = line_after_cursor:find(vim.pesc(char))
    if pos and (min_pos == nil or pos < min_pos) then
      min_pos = pos
    end
  end

  -- If found, move cursor just after it
  if min_pos then
    vim.api.nvim_win_set_cursor(0, { vim.api.nvim_win_get_cursor(0)[1], cursor_col + min_pos })
  end
end, {})

-- Map it to a key combination in insert mode
vim.api.nvim_set_keymap("i", "kc", "<ESC>:EscapeDelimiter<CR>i", { noremap = true, silent = true })
