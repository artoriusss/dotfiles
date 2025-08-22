local colors = {
  bg         = "#1c0c28",
  fg         = "#ffffff",
  cursor     = "#00ffff",
  cursor_fg  = "#000000",
  sel_bg     = "#606060",
  sel_fg     = "#ffffff",

  -- Accents 
  cyan       = "#5cb1b3",
  magenta    = "#9d54a7",
  purple     = "#7e83cc",
  pink       = "#bc94b7",
  red        = "#c87272",
  blue       = "#90a5bd",
  green      = "#0aff99",
  lgreen     = "#c6e960",
  yellow     = "#ffd75f",
  gray       = "#5e6071",
}

vim.cmd("highlight clear")
vim.cmd("set background=dark")
if vim.fn.exists("syntax_on") then
  vim.cmd("syntax reset")
end
vim.g.colors_name = "blueberrypie"

-- Basic UI
vim.api.nvim_set_hl(0, "Normal",       { fg = colors.fg, bg = colors.bg })
vim.api.nvim_set_hl(0, "Cursor",       { fg = colors.cursor_fg, bg = colors.cursor })
vim.api.nvim_set_hl(0, "Visual",       { bg = colors.sel_bg })
vim.api.nvim_set_hl(0, "Search",       { fg = colors.bg, bg = colors.green, bold = true })
vim.api.nvim_set_hl(0, "LineNr",       { fg = colors.gray })
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = colors.lgreen, bold = true })
vim.api.nvim_set_hl(0, "StatusLine",   { fg = colors.fg, bg = colors.gray })
vim.api.nvim_set_hl(0, "VertSplit",    { fg = colors.gray })

-- Syntax
vim.api.nvim_set_hl(0, "Comment",      { fg = colors.gray, italic = true })
vim.api.nvim_set_hl(0, "Constant",     { fg = colors.cyan })
vim.api.nvim_set_hl(0, "String",       { fg = colors.lgreen })

vim.api.nvim_set_hl(0, "Character",    { fg = colors.pink })
vim.api.nvim_set_hl(0, "Number",       { fg = colors.yellow })
vim.api.nvim_set_hl(0, "Boolean",      { fg = colors.magenta, bold = true })
vim.api.nvim_set_hl(0, "Identifier",   { fg = colors.cyan })
vim.api.nvim_set_hl(0, "Function",     { fg = colors.purple, bold = true })
vim.api.nvim_set_hl(0, "Statement",    { fg = colors.magenta, bold = true })
vim.api.nvim_set_hl(0, "Keyword",      { fg = colors.red, bold = true })
vim.api.nvim_set_hl(0, "PreProc",      { fg = colors.blue })
vim.api.nvim_set_hl(0, "Type",         { fg = colors.yellow, bold = true })
vim.api.nvim_set_hl(0, "Special",      { fg = colors.pink })
vim.api.nvim_set_hl(0, "Underlined",   { fg = colors.green, underline = true })

-- Diagnostics
vim.api.nvim_set_hl(0, "DiagnosticError", { fg = colors.red })
vim.api.nvim_set_hl(0, "DiagnosticWarn",  { fg = colors.yellow })
vim.api.nvim_set_hl(0, "DiagnosticInfo",  { fg = colors.blue })
vim.api.nvim_set_hl(0, "DiagnosticHint",  { fg = colors.green })

