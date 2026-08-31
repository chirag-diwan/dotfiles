vim.g.mapleader = " "
vim.keymap.set("n", "<C-e>", function()
  vim.cmd("Ex")
end)



local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live Grep" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help Tags" })
vim.keymap.set("n", "<leader>fd", function()
  vim.cmd("Telescope diagnostics")
end
);

vim.keymap.set("n", "<left>", '<cmd> echo "Use h to move left"<CR>')
vim.keymap.set("n", "<right>", '<cmd> echo "Use l to move right"<CR>')
vim.keymap.set("n", "<up>", '<cmd> echo "Use k to move up"<CR>')
vim.keymap.set("n", "<down>", '<cmd> echo "Use j to move down"<CR>')
vim.keymap.set({ "n", "i", "v" }, "<C-c>", '<Esc>')
vim.keymap.set({ "n", "i", "v" }, "<Esc>", '<cmd>echo "Use ctrl c to esc"<CR>')
vim.keymap.set({ "n", "v" }, "Y", '"+y<CR>')


vim.keymap.set("n", "<C-j>", "^")
vim.keymap.set("n", "<C-k>", "$")

local harpoon = require("harpoon")

harpoon:setup()

vim.keymap.set({"n" , "i"}, "<C-l>", function() harpoon:list():add() end)
vim.keymap.set({"n" , "i"}, "<C-p>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "8", function() harpoon:list():select(1) end)
vim.keymap.set("n", "9", function() harpoon:list():select(2) end)
vim.keymap.set("n", "0", function() harpoon:list():select(3) end)
vim.keymap.set("n", "-", function() harpoon:list():select(4) end)
vim.keymap.set("n", "<C-j>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<C-k>", function() harpoon:list():next() end)


vim.keymap.set("n", "<C-f>", "<cmd>Telescope lsp_document_symbols<CR>")

vim.keymap.set("n", "gra", function()
  vim.lsp.buf.code_action({
    apply = true,
  })
end)
