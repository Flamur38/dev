vim.cmd("hi clear")
if vim.fn.exists("syntax_on") == 1 then
    vim.cmd("syntax reset")
end

vim.g.colors_name = "nightops"

local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
end

----------------------------------------------------------
-- Palette
----------------------------------------------------------

local c = {
    bg         = "#060B13",
    bg_alt     = "#0B111B",
    bg_popup   = "#0F1622",
    visual     = "#182233",

    fg         = "#D7DFEA",
    fg_dim     = "#8A98A8",

    comment    = "#66788D",

    keyword    = "#AF8BE8",
    keyword2   = "#9373D3",

    string     = "#E6B46C",
    number     = "#D89C61",

    type       = "#8AA8CF",

    border     = "#16202E",
    gutter     = "#263243",

    red        = "#E06C75",
    orange     = "#D9A441",
    blue       = "#6FA8DC",
}

----------------------------------------------------------
-- UI
----------------------------------------------------------

hi("Normal",          { fg = c.fg, bg = c.bg })
hi("NormalNC",        { fg = c.fg, bg = c.bg })
hi("EndOfBuffer",     { fg = c.bg, bg = c.bg })

hi("CursorLine",      { bg = "NONE" })
hi("CursorLineNr",    { fg = c.fg, bold = true })
hi("LineNr",          { fg = c.gutter })

hi("SignColumn",      { bg = c.bg })

hi("StatusLine",      { fg = c.fg_dim, bg = c.bg_alt })
hi("StatusLineNC",    { fg = c.gutter, bg = c.bg })

hi("WinSeparator",    { fg = c.border })
hi("VertSplit",       { fg = c.border })

hi("Visual",          { bg = c.visual })

hi("Pmenu",           { fg = c.fg, bg = c.bg_popup })
hi("PmenuSel",        { fg = c.bg, bg = c.fg })

hi("Search",          { fg = c.bg, bg = c.string })
hi("IncSearch",       { fg = c.bg, bg = c.keyword })

----------------------------------------------------------
-- Diagnostics
----------------------------------------------------------

hi("DiagnosticError", { fg = c.red })
hi("DiagnosticWarn",  { fg = c.orange })
hi("DiagnosticInfo",  { fg = c.blue })
hi("DiagnosticHint",  { fg = c.type })

----------------------------------------------------------
-- Syntax
----------------------------------------------------------

hi("Comment",         { fg = c.comment })

hi("Keyword",         { fg = c.keyword })
hi("Conditional",     { fg = c.keyword })
hi("Repeat",          { fg = c.keyword })
hi("Statement",       { fg = c.keyword2 })
hi("Exception",       { fg = c.keyword2 })

-- Functions are intentionally neutral
hi("Function",        { fg = c.fg })
hi("Identifier",      { fg = c.fg })

hi("String",          { fg = c.string })
hi("Character",       { fg = c.string })

hi("Number",          { fg = c.blue })
hi("Float",           { fg = c.number })
hi("Boolean",         { fg = c.red })

hi("Type",            { fg = c.type })
hi("Structure",       { fg = c.type })
hi("Typedef",         { fg = c.type })

hi("Constant",        { fg = c.fg })

hi("Operator",        { fg = c.fg_dim })

hi("Delimiter",       { fg = c.fg_dim })
hi("Special",         { fg = c.fg })

hi("Include",         { fg = c.type })
hi("PreProc",         { fg = c.type })

----------------------------------------------------------
-- Treesitter
----------------------------------------------------------

hi("@variable",               { fg = c.fg })
hi("@variable.builtin",       { fg = c.fg })

hi("@parameter",              { fg = c.fg })

hi("@property",               { fg = c.fg })
hi("@field",                  { fg = c.fg })

hi("@function",               { fg = c.fg })
hi("@function.call",          { fg = c.fg })
hi("@function.method",        { fg = c.fg })
hi("@method",                 { fg = c.fg })
hi("@method.call",            { fg = c.fg })

hi("@keyword",                { fg = c.keyword })
hi("@keyword.return",         { fg = c.keyword })
hi("@keyword.function",       { fg = c.keyword })
hi("@keyword.operator",       { fg = c.keyword })
hi("@keyword.import",         { fg = c.type })

hi("@string",                 { fg = c.string })
hi("@string.escape",          { fg = c.number })

hi("@number",                 { fg = c.blue })
hi("@boolean",                { fg = c.red })

hi("@type",                   { fg = c.type })
hi("@type.builtin",           { fg = c.type })

hi("@comment",                { fg = c.comment })

hi("@constant",               { fg = c.fg })

hi("@operator",               { fg = c.fg_dim })

hi("@punctuation.bracket",    { fg = c.fg_dim })
hi("@punctuation.delimiter",  { fg = c.fg_dim })

----------------------------------------------------------
-- Telescope
----------------------------------------------------------

hi("TelescopeNormal",     { fg = c.fg, bg = c.bg })
hi("TelescopeBorder",     { fg = c.border, bg = c.bg })
hi("TelescopeSelection",  { bg = c.bg_alt })
hi("TelescopeMatching",   { fg = c.keyword })

vim.opt.cursorline = true
