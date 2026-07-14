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

local cmp = require('cmp')
cmp.setup({
  window = {
    completion = cmp.config.window.bordered({
      border = "rounded",
      winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
    }),
    documentation = cmp.config.window.bordered({
      border = "rounded",
      winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
    }),
  },
  mapping = {
    ['<C-k>'] = cmp.mapping.confirm({ select = true }),
  },
})

vim.api.nvim_create_user_command("Search", function(opts)
  vim.cmd('vimgrep /' .. opts.args .. '/j **/*')
end, { nargs = 1 })
