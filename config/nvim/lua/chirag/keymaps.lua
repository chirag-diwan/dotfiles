vim.g.mapleader = " "
vim.keymap.set("n", "<C-e>", function()
  vim.cmd("Ex")
end
)
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live Grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "List Buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help Tags" })
vim.keymap.set("n", "<leader>fd", function()
  vim.cmd("Telescope diagnostics")
end
);

vim.keymap.set("n", "<left>", '<cmd> echo "Use h to move left"<CR>')
vim.keymap.set("n", "<right>", '<cmd> echo "Use l to move right"<CR>')
vim.keymap.set("n", "<up>", '<cmd> echo "Use k to move up"<CR>')
vim.keymap.set("n", "<down>", '<cmd> echo "Use j to move down"<CR>')

vim.keymap.set({ "n", "v" }, "Y", '"+y<CR>')

vim.keymap.set({ "n", "i", "o" }, "<C-r>", function()
  local row = vim.api.nvim_win_get_cursor(0)[1]
  local buf = vim.api.nvim_get_current_buf()

  vim.api.nvim_buf_set_lines(buf, row, row, false, {
    "if err != nil {",
    "\tlog.Fatal(err)",
    "}",
  })

  -- Move cursor inside the block
  vim.api.nvim_win_set_cursor(0, { row + 1, 1 })
end, { desc = "Insert Go error check" })
