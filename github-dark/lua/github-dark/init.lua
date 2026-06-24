local M = {}

function M.setup()
  vim.cmd("hi clear")
  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end
  vim.o.background = "dark"
  vim.o.termguicolors = true

  local palette = require("github-dark.palette")
  require("github-dark.highlights").setup(palette)
end

return M
