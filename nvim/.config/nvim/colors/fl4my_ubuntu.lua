vim.cmd("hi clear")
if vim.fn.exists("syntax_on") == 1 then
    vim.cmd("syntax reset")
end

vim.g.colors_name = "fl4my_ubuntu"

local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
end

----------------------------------------------------------
-- Ubuntu Official Palette
-- orange:    #E95420  Ubuntu Orange
-- aubergine: #5E2750  Ubuntu Aubergine
-- midnight:  #2C001E  Ubuntu Midnight (darkest)
-- warm grey: #AEA79F
-- cool grey: #333333
--
-- Terminal colors (your setup):
-- bg:        #200020  deep aubergine black
-- fg:        #D0D0FF  soft lavender white
----------------------------------------------------------

local c = {
    bg         = "#200020",           -- your terminal bg
    bg_alt     = "#2C001E",           -- Ubuntu Midnight — popups, statusline
    bg_popup   = "#380038",           -- slightly lighter for pmenu
    visual     = "#5E2750",           -- Ubuntu Aubergine — visual selection

    fg         = "#D0D0FF",           -- soft lavender white
    fg_dim     = "#AEA79F",           -- Ubuntu Warm Grey — dimmed text

    comment    = "#AEA79F",           -- warm grey — subtle comments
    comment_italic = true,

    keyword    = "#E95420",           -- Ubuntu Orange — if, while, def, for
    keyword2   = "#ff6a3d",           -- lighter orange — return, break, raise

    string     = "#26A269",           -- warm brown -- strings
    number     = "#E95420",           -- orange for numbers

    type       = "#c47ac0",           -- soft aubergine-pink — types, imports
    builtin    = "#e8a598",           -- desaturated orange — builtins

    border     = "#5E2750",           -- aubergine border
    gutter     = "#5E2750",           -- aubergine gutter numbers

    red        = "#E95420",           -- Ubuntu Orange (used as red/error)
    orange     = "#E95420",
    blue       = "#9db8d2",           -- cool muted blue for info
    green      = "#4e9a06",           -- muted green for hints
}

----------------------------------------------------------
-- UI
----------------------------------------------------------

hi("Normal",          { fg = c.fg,      bg = c.bg })
hi("NormalNC",        { fg = c.fg,      bg = c.bg })
hi("EndOfBuffer",     { fg = c.bg,      bg = c.bg })

hi("CursorLine",      { bg = "NONE" })
hi("CursorLineNr",    { fg = c.keyword, bold = true })
hi("LineNr",          { fg = c.gutter })

hi("SignColumn",      { bg = c.bg })

hi("StatusLine",      { fg = c.fg,      bg = c.bg_alt, bold = true })
hi("StatusLineNC",    { fg = c.fg_dim,  bg = c.bg })

hi("WinSeparator",    { fg = c.border })
hi("VertSplit",       { fg = c.border })

hi("Visual",          { bg = c.visual })

hi("Pmenu",           { fg = c.fg,      bg = c.bg_popup })
hi("PmenuSel",        { fg = c.bg,      bg = c.keyword })

hi("Search",          { fg = c.bg,      bg = c.keyword })
hi("IncSearch",       { fg = c.bg,      bg = c.fg })

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
hi("Boolean",         { fg = c.keyword })

hi("Type",            { fg = c.type })
hi("Structure",       { fg = c.type })
hi("Typedef",         { fg = c.type })

hi("Constant",        { fg = c.fg })
hi("Operator",        { fg = c.fg_dim })
hi("Delimiter",       { fg = c.fg_dim })
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

hi("@function",               { fg = c.fg,       bold = true })
hi("@function.call",          { fg = c.fg,       bold = true })
hi("@function.builtin",       { fg = c.builtin,  bold = true })
hi("@function.method",        { fg = c.fg,       bold = true })
hi("@method",                 { fg = c.fg,       bold = true })
hi("@method.call",            { fg = c.fg,       bold = true })

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
hi("@string.escape",          { fg = c.keyword })

hi("@number",                 { fg = c.number })
hi("@float",                  { fg = c.number })
hi("@boolean",                { fg = c.keyword })

hi("@type",                   { fg = c.type })
hi("@type.builtin",           { fg = c.type })

hi("@comment",                { fg = c.comment, italic = true })

hi("@constant",               { fg = c.fg })
hi("@constant.builtin",       { fg = c.builtin })
hi("@attribute",              { fg = c.keyword })

hi("@operator",               { fg = c.fg_dim })
hi("@punctuation.bracket",    { fg = c.fg_dim })
hi("@punctuation.delimiter",  { fg = c.fg_dim })

hi("@namespace",              { fg = c.type })

----------------------------------------------------------
-- Telescope
----------------------------------------------------------

hi("TelescopeNormal",     { fg = c.fg,      bg = c.bg })
hi("TelescopeBorder",     { fg = c.border,  bg = c.bg })
hi("TelescopeSelection",  { bg = c.bg_alt })
hi("TelescopeMatching",   { fg = c.keyword })

vim.opt.cursorline = true
