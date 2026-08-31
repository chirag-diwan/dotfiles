vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.updatetime = 200
vim.opt.timeoutlen = 200
vim.o.laststatus = 0
vim.opt.hlsearch = false
vim.opt.mouse = ""


vim.diagnostic.config({
  virtual_text = true, -- inline errors
  signs = false,       -- gutter icons
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.undofile = true -- Keeps persistent undo history without interfering

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "cpp" },
  callback = function()
    vim.opt_local.cinoptions:append("j1,(0,ws")
  end,
})
