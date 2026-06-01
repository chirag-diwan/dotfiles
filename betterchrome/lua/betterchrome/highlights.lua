local M = {}

function M.setup(palette)
  local set_hl = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  set_hl("Normal", { bg = palette.carbon_black, fg = palette.pale_slate })
  set_hl("LineNr", { fg = palette.slate_grey })
  set_hl("CursorLine", { bg = palette.gunmetal })
  set_hl("CursorLineNr", { fg = palette.bright_snow, bold = false })
  set_hl("Visual", { bg = palette.iron_grey })
  set_hl("Search", { bg = palette.pale_slate_2, fg = palette.carbon_black })

  set_hl("Comment", { fg = palette.iron_grey, italic = false })
  set_hl("String", { fg = palette.glow })
  set_hl("Keyword", { fg = palette.slate_grey, bold = false })
  set_hl("Statement", { fg = palette.pale_slate_2, bold = false })
  set_hl("Function", { fg = palette.slate_grey_2 })
  set_hl("Identifier", { fg = palette.pale_slate })
  set_hl("Type", { fg = palette.slate_grey, bold = false })
  set_hl("Constant", { fg = palette.pale_slate })
  set_hl("Number", { fg = palette.pale_slate })

  set_hl("@punctuation.bracket", { fg = palette.glow, bold = false })
  set_hl("@punctuation.delimiter", { fg = palette.glow, bold = true })

  set_hl("@variable", { fg = palette.pale_slate })
  set_hl("@property", { fg = palette.slate_grey_2 })
  set_hl("@variable.member", { fg = palette.platinum })

  set_hl("@operator", { fg = palette.slate_grey, bold = false }) -- e.g., + - =
  set_hl("@parameter", { fg = palette.alabaster })               -- function arguments
  set_hl("Delimiter", { fg = palette.glow })
  set_hl("@punctuation.delimiter", { fg = palette.glow })
  set_hl("@punctuation.bracket", { fg = palette.glow })
end

return M
