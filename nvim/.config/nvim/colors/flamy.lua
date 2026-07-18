vim.cmd("hi clear")
if vim.fn.exists("syntax_on") == 1 then
    vim.cmd("syntax reset")
end

vim.g.colors_name = "flamy"

local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
end

----------------------------------------------------------
-- Palette — flamy earthy/warm
-- bg:       #1b1f20  dark charcoal
-- fg:       #c3c3ad  warm grey-green
-- keyword:  #bf8897  muted rose/mauve
-- string:   #b2bb46  yellow-green
-- number:   #e3812d  orange
-- comment:  #928374  warm grey
-- gold:     #deb54e  golden yellow (tmux accent)
-- sand:     #d5c3a5  warm sand
----------------------------------------------------------

local c = {
    bg         = "#1b1f20",
    bg_alt     = "#22272a",
    bg_popup   = "#2a2f32",
    visual     = "#3d3837",

    fg         = "#c3c3ad",
    fg_dim     = "#928374",

    comment    = "#928374",

    keyword    = "#bf8897",           -- if, elif, else, while, for, def
    keyword2   = "#a06070",           -- return, break, raise

    string     = "#b2bb46",           -- strings
    number     = "#e3812d",           -- numbers
    gold       = "#deb54e",           -- golden — types, imports

    border     = "#3d3837",
    gutter     = "#3d3837",

    red        = "#cc241d",
    orange     = "#e3812d",
    blue       = "#458588",
    green      = "#b2bb46",
}

----------------------------------------------------------
-- UI
----------------------------------------------------------

hi("Normal",          { fg = c.fg,      bg = c.bg })
hi("NormalNC",        { fg = c.fg,      bg = c.bg })
hi("EndOfBuffer",     { fg = c.bg,      bg = c.bg })

hi("CursorLine",      { bg = "NONE" })
hi("CursorLineNr",    { fg = c.gold,    bold = true })
hi("LineNr",          { fg = c.gutter })

hi("SignColumn",      { bg = c.bg })

hi("StatusLine",      { fg = c.fg,      bg = c.bg_alt, bold = true })
hi("StatusLineNC",    { fg = c.fg_dim,  bg = c.bg })

hi("WinSeparator",    { fg = c.border })
hi("VertSplit",       { fg = c.border })

hi("Visual",          { bg = c.visual })

hi("Pmenu",           { fg = c.fg,      bg = c.bg_popup })
hi("PmenuSel",        { fg = c.bg,      bg = c.gold })

hi("Search",          { fg = c.bg,      bg = c.gold })
hi("IncSearch",       { fg = c.bg,      bg = c.string })

hi("MatchParen",      { fg = c.keyword, bold = true })

----------------------------------------------------------
-- Diagnostics
----------------------------------------------------------

hi("DiagnosticError", { fg = c.red })
hi("DiagnosticWarn",  { fg = c.orange })
hi("DiagnosticInfo",  { fg = c.blue })
hi("DiagnosticHint",  { fg = c.green })

----------------------------------------------------------
-- Syntax
----------------------------------------------------------

hi("Comment",         { fg = c.comment, italic = true })

hi("Keyword",         { fg = c.keyword })
hi("Conditional",     { fg = c.keyword })
hi("Repeat",          { fg = c.keyword })
hi("Statement",       { fg = c.keyword2 })
hi("Exception",       { fg = c.keyword2 })

hi("Function",        { fg = c.fg,      bold = true })
hi("Identifier",      { fg = c.fg })

hi("String",          { fg = c.string })
hi("Character",       { fg = c.string })

hi("Number",          { fg = c.number })
hi("Float",           { fg = c.number })
hi("Boolean",         { fg = c.red,     bold = true })

hi("Type",            { fg = c.gold })
hi("Structure",       { fg = c.gold })
hi("Typedef",         { fg = c.gold })

hi("Constant",        { fg = c.fg })
hi("Operator",        { fg = c.fg })
hi("Delimiter",       { fg = c.fg })
hi("Special",         { fg = c.fg })

hi("Include",         { fg = c.gold })
hi("PreProc",         { fg = c.gold })

----------------------------------------------------------
-- Treesitter
----------------------------------------------------------

hi("@variable",               { fg = c.fg })
hi("@variable.builtin",       { fg = c.fg })
hi("@parameter",              { fg = c.fg })
hi("@property",               { fg = c.fg })
hi("@field",                  { fg = c.fg })

hi("@function",               { fg = c.fg,      bold = true })
hi("@function.call",          { fg = c.fg,      bold = true })
hi("@function.builtin",       { fg = c.fg,      bold = true })
hi("@function.method",        { fg = c.fg,      bold = true })
hi("@method",                 { fg = c.fg,      bold = true })
hi("@method.call",            { fg = c.fg,      bold = true })

hi("@keyword",                { fg = c.keyword })
hi("@keyword.return",         { fg = c.keyword2 })
hi("@keyword.function",       { fg = c.keyword })
hi("@keyword.operator",       { fg = c.keyword })
hi("@keyword.import",         { fg = c.gold })
hi("@keyword.conditional",    { fg = c.keyword })
hi("@keyword.repeat",         { fg = c.keyword })
hi("@keyword.exception",      { fg = c.keyword2 })
hi("@keyword.coroutine",      { fg = c.keyword })

hi("@string",                 { fg = c.string })
hi("@string.escape",          { fg = c.orange })

hi("@number",                 { fg = c.number })
hi("@float",                  { fg = c.number })
hi("@boolean",                { fg = c.red,     bold = true })

hi("@type",                   { fg = c.gold })
hi("@type.builtin",           { fg = c.gold })

hi("@comment",                { fg = c.comment, italic = true })

hi("@constant",               { fg = c.fg })
hi("@constant.builtin",       { fg = c.red,     bold = true })
hi("@attribute",              { fg = c.keyword })

hi("@operator",               { fg = c.fg })
hi("@punctuation.bracket",    { fg = c.fg })
hi("@punctuation.delimiter",  { fg = c.fg })

hi("@namespace",              { fg = c.gold })

----------------------------------------------------------
-- Telescope
----------------------------------------------------------

hi("TelescopeNormal",     { fg = c.fg,      bg = c.bg })
hi("TelescopeBorder",     { fg = c.border,  bg = c.bg })
hi("TelescopeSelection",  { bg = c.bg_alt })
hi("TelescopeMatching",   { fg = c.gold })

vim.opt.cursorline = true
