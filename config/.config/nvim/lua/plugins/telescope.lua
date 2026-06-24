return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("telescope").setup({
      defaults = {
        file_ignore_patterns = { "node_modules", ".git" },
        layout_config = {
          horizontal = { width = 0.9, height = 0.85 },
        },
        sorting_strategy = "ascending",
      },
    })
  end,
}
