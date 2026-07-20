vim.cmd("hi clear")
if vim.fn.exists("syntax_on") == 1 then
    vim.cmd("syntax reset")
end

vim.g.colors_name = "htb"

local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
end

----------------------------------------------------------
-- Juliana Palette (Sublime Mariana port)
-- bg:       #0F1623  dark navy
-- fg:       #a4b1cd  muted blue-grey
-- red:      #EC5F66  errors, booleans
-- green:    #99C794  strings
-- orange:   #F97B58  numbers
-- blue:     #5C99D6  functions, types, imports
-- purple:   #C695C6  keywords
-- cyan:     #5FB4B4  methods
-- dim:      #313f55  selection, borders
-- comment:  #46525C  comments
----------------------------------------------------------

local c = {
    bg         = "#0F1623",
    bg_alt     = "#1e2a3a",
    bg_popup   = "#253245",
    visual     = "#313f55",

    fg         = "#a4b1cd",
    fg_dim     = "#46525C",

    comment    = "#46525C",

    keyword    = "#C695C6",           -- purple — if, while, for, def
    keyword2   = "#A67DB8",           -- dim purple — return, break, raise

    string     = "#99C794",           -- green — strings
    number     = "#F97B58",           -- orange — numbers
    type       = "#5C99D6",           -- blue — types, imports
    func       = "#5C99D6",           -- blue — functions
    builtin    = "#5C99D6",           -- blue — builtins, print

    border     = "#313f55",
    gutter     = "#313f55",

    red        = "#EC5F66",
    orange     = "#F97B58",
    green      = "#99C794",
    blue       = "#5C99D6",
    cyan       = "#5FB4B4",
    purple     = "#C695C6",
}

----------------------------------------------------------
-- UI
----------------------------------------------------------

hi("Normal",          { fg = c.fg,      bg = c.bg })
hi("NormalNC",        { fg = c.fg,      bg = c.bg })
hi("EndOfBuffer",     { fg = c.bg,      bg = c.bg })

hi("CursorLine",      { bg = "NONE" })
hi("CursorLineNr",    { fg = c.cyan,    bold = true })
hi("LineNr",          { fg = c.gutter })

hi("SignColumn",      { bg = c.bg })

hi("StatusLine",      { fg = c.fg,      bg = c.bg_alt, bold = true })
hi("StatusLineNC",    { fg = c.fg_dim,  bg = c.bg })

hi("WinSeparator",    { fg = c.border })
hi("VertSplit",       { fg = c.border })

hi("Visual",          { bg = c.visual })

hi("Pmenu",           { fg = c.fg,      bg = c.bg_popup })
hi("PmenuSel",        { fg = c.bg,      bg = c.cyan })

hi("Search",          { fg = c.bg,      bg = c.orange })
hi("IncSearch",       { fg = c.bg,      bg = c.green })

hi("MatchParen",      { fg = c.cyan,    bold = true })

----------------------------------------------------------
-- Diagnostics
----------------------------------------------------------

hi("DiagnosticError", { fg = c.red })
hi("DiagnosticWarn",  { fg = c.orange })
hi("DiagnosticInfo",  { fg = c.blue })
hi("DiagnosticHint",  { fg = c.cyan })

----------------------------------------------------------
-- Syntax
----------------------------------------------------------

hi("Comment",         { fg = c.comment, italic = true })

hi("Keyword",         { fg = c.keyword })
hi("Conditional",     { fg = c.keyword })
hi("Repeat",          { fg = c.keyword })
hi("Statement",       { fg = c.keyword2 })
hi("Exception",       { fg = c.keyword2 })

hi("Function",        { fg = c.func,    bold = true })
hi("Identifier",      { fg = c.fg })

hi("String",          { fg = c.string })
hi("Character",       { fg = c.string })

hi("Number",          { fg = c.number })
hi("Float",           { fg = c.number })
hi("Boolean",         { fg = c.red,     bold = true })

hi("Type",            { fg = c.type })
hi("Structure",       { fg = c.type })
hi("Typedef",         { fg = c.type })

hi("Constant",        { fg = c.fg })
hi("Operator",        { fg = c.fg })
hi("Delimiter",       { fg = c.fg })
hi("Special",         { fg = c.builtin })

hi("Include",         { fg = c.type })
hi("PreProc",         { fg = c.type })

----------------------------------------------------------
-- Treesitter
----------------------------------------------------------

hi("@variable",               { fg = c.fg })
hi("@variable.builtin",       { fg = c.builtin })
hi("@parameter",              { fg = c.fg })
hi("@property",               { fg = c.fg })
hi("@field",                  { fg = c.fg })

hi("@function",               { fg = c.func,    bold = true })
hi("@function.call",          { fg = c.func,    bold = true })
hi("@function.builtin",       { fg = c.builtin, bold = true })
hi("@function.method",        { fg = c.cyan,    bold = true })
hi("@method",                 { fg = c.cyan,    bold = true })
hi("@method.call",            { fg = c.cyan,    bold = true })

hi("@keyword",                { fg = c.keyword })
hi("@keyword.return",         { fg = c.keyword2 })
hi("@keyword.function",       { fg = c.keyword })
hi("@keyword.operator",       { fg = c.keyword })
hi("@keyword.import",         { fg = c.type })
hi("@keyword.conditional",    { fg = c.keyword })
hi("@keyword.repeat",         { fg = c.keyword })
hi("@keyword.exception",      { fg = c.keyword2 })
hi("@keyword.coroutine",      { fg = c.keyword })

hi("@string",                 { fg = c.string })
hi("@string.escape",          { fg = c.cyan })

hi("@number",                 { fg = c.number })
hi("@float",                  { fg = c.number })
hi("@boolean",                { fg = c.red,     bold = true })

hi("@type",                   { fg = c.type })
hi("@type.builtin",           { fg = c.type })

hi("@comment",                { fg = c.comment, italic = true })

hi("@constant",               { fg = c.fg })
hi("@constant.builtin",       { fg = c.red,     bold = true })
hi("@attribute",              { fg = c.purple })

hi("@operator",               { fg = c.fg })
hi("@punctuation.bracket",    { fg = c.fg })
hi("@punctuation.delimiter",  { fg = c.fg })

hi("@namespace",              { fg = c.type })

----------------------------------------------------------
-- Telescope
----------------------------------------------------------

hi("TelescopeNormal",     { fg = c.fg,      bg = c.bg })
hi("TelescopeBorder",     { fg = c.border,  bg = c.bg })
hi("TelescopeSelection",  { bg = c.bg_alt })
hi("TelescopeMatching",   { fg = c.green })

vim.opt.cursorline = true

-- netrw / file explorer
hi("Directory", { fg = "#5C99D6", bold = true })
