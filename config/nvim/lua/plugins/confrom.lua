return {
  "stevearc/conform.nvim",
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        lua = { "stylua" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        json = { "prettier" },
        html = { "prettier" },
        css = { "prettier" },
        python = { "black" },
        sh = { "shfmt" },
        rust = { "rustfmt" },
        c = { "clang_format" },
        cpp = { "clang_format" },
        go = {"gopls"}
      },

      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = false,
      },
    })
  end
}
