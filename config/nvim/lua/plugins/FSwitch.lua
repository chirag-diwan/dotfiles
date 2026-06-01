return {
  "chirag-diwan/FSwitch.nvim",
  config = function()
    require("FSwitch").setup(
      {
        hotkeys = {
          pin1 = "8", -- For ultra fast context switching , in this respective order
          pin2 = "9",
          pin3 = "0",
        },
        ui = {
          width = 0.8,
          height = 0.6,
          border = "rounded",
          title = " Pinned ",
        },

        keys = {
          toggle_pin = "<leader>pa",
          display_pins = "<leader>pp",
          close = "<Esc>",
          cur_down = "j",
          cur_up = "k",
          select = "<CR>",
          reorder_up = "<C-k>",
          reorder_down = "<C-j>",
          delete_pin = "d",
        }
      }
    )
  end
}
