vim.o.background = 'dark'
vim.g.termguicolors = false 

--vim.cmd.colorscheme("betterchrome")
--vim.cmd.colorscheme("simple")
--vim.cmd.colorscheme("github-dark")
--vim.cmd.colorscheme("tokyonight-night")
--vim.cmd.colorscheme("rose-pine")
--require("betterchrome").setup()
vim.cmd.colorscheme("betterchrome")
--vim.cmd.colorscheme("alabaster")
--vim.cmd.colorscheme("gruvbox")
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })

