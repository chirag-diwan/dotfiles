local M = {}

function M.setup()
  vim.cmd("hi clear")
  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end
  vim.o.background = "dark"
  vim.o.termguicolors = true

  local palette = require("betterchrome.palette")
  require("betterchrome.highlights").setup(palette)
end

return M
