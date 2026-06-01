return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  opts = {
    ensure_installed = { "cpp", "tsx", "lua", "javascript", "typescript" },
    highlight = { enable = true },
    indent = { enable = true },
    incremental_selection = { enable = true },
    folds = { enable = true },
  },
  build = ":TSUpdate",
}
