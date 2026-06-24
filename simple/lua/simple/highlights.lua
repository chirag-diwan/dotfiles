local M = {}

function M.setup(palette)
  local set_hl = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  -- Base UI
  set_hl("Normal", { bg = palette.background, fg = palette.foreground })
  set_hl("LineNr", { fg = palette.bright_black })
  -- WARNING: palette.black is identical to background. Using bright_black for visibility.
  set_hl("CursorLine", { bg = palette.black })
  set_hl("CursorLineNr", { fg = palette.bright_white, bold = true })
  set_hl("Visual", { bg = palette.bright_black })
  set_hl("Search", { bg = palette.yellow, fg = palette.background })

  -- Subordination (Noise Reduction)
  set_hl("Comment", { fg = palette.bright_black, italic = true })

  -- Core Logic (Structure)
  set_hl("Keyword", { fg = palette.magenta, bold = false })
  set_hl("Statement", { fg = palette.magenta, bold = false })
  set_hl("Type", { fg = palette.cyan, bold = false })

  -- Data & Action (Richness)
  set_hl("String", { fg = palette.green })
  set_hl("Constant", { fg = palette.yellow })
  set_hl("Number", { fg = palette.yellow })
  set_hl("Function", { fg = palette.blue })

  -- Variables & Identifiers (Neutrality)
  set_hl("Identifier", { fg = palette.foreground })
  set_hl("@variable", { fg = palette.foreground })
  set_hl("@property", { fg = palette.bright_blue })
  set_hl("@variable.member", { fg = palette.bright_blue })
  set_hl("@parameter", { fg = palette.bright_white, italic = true })

  -- Punctuation (Diminished)
  set_hl("Delimiter", { fg = palette.bright_black })
  set_hl("@operator", { fg = palette.bright_black, bold = false })
  set_hl("@punctuation.bracket", { fg = palette.bright_black })
  set_hl("@punctuation.delimiter", { fg = palette.bright_black })
  set_hl("Directory", { fg = palette.blue, bold = false })
  set_hl("netrwDir", { fg = palette.blue, bold = false })

  set_hl("netrwClassify", { fg = palette.bright_black })
  set_hl("netrwExe", { fg = palette.green })
  set_hl("netrwSymLink", { fg = palette.cyan })
  set_hl("netrwLink", { fg = palette.cyan })
  set_hl("netrwTreeBar", { fg = palette.bright_black })
  set_hl("netrwHelpCmd", { fg = palette.yellow })
  set_hl("netrwCmdSep", { fg = palette.bright_black })
  set_hl("netrwVersion", { fg = palette.magenta })
end

return M
