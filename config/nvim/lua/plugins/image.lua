return {
  "3rd/image.nvim",
  config = function()
    require("image").setup({
      backend = "kitty",        -- or "ueberzug" or "sixel"
      processor = "magick_cli", -- or "magick_rock"
      integrations = {
        markdown = {
          enabled = true,
          clear_in_insert_mode = false,
          download_remote_images = true,
          only_render_image_at_cursor = false,
          only_render_image_at_cursor_mode = "inline", -- or "inline"
          floating_windows = false,
          filetypes = { "markdown", "vimwiki" },       -- markdown extensions (ie. quarto) can go here
        },
      },
      hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.avif" },
    })
  end,
  opts = {
    backend = "kitty", -- or "ueberzug", "wezterm", etc.
    integrations = {
      markdown = {
        enabled = true,
      },
    },
  },
}
