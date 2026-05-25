-- juliana.lua — port of Sublime's Mariana palette
-- bg: #303841  fg: #d8dee9

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") then vim.cmd("syntax reset") end
vim.g.colors_name = "juliana"

local c = {
    -- backgrounds
    bg1          = "#444e59",  -- lighter bg (statusline, float)
    -- bg2          = "#303841",  -- main bg
    bg2          = "#1E2329",  -- main bg
    bg3          = "#2e353e",  -- darker bg (sidebar, netrw)
    selection    = "#3f4750",  -- visual selection
    diff_text    = "#373f48",
    diff_change  = "#585249",
    diff_remove  = "#4f434a",
    -- foregrounds
    fg1          = "#ffffff",  -- brackets ( [
    fg2          = "#d8dee9",  -- normal text
    fg3          = "#a6acb9",  -- comments
    fg4          = "#46525c",  -- line numbers
    -- accent colors
    yellow2      = "#f9ae58",  -- numbers
    green        = "#99c794",  -- strings
    magenta      = "#c695c6",  -- if, else, import, keywords
    red2         = "#ec5f66",  -- True, False, booleans
    blue2        = "#5c99d6",  -- print, input, int, builtins
    cyan2        = "#5fb4b4",  -- string quotes, def name, namespaces
    -- extras
    border       = "#5c99d6",
    line         = "#2e353e",
}

local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
end

-- ── Core ──────────────────────────────────────────────────────────────────────
hi("Normal",        { fg = c.fg2,      bg = c.bg2 })
hi("NormalFloat",   { fg = c.fg2,      bg = c.bg3 })
hi("FloatBorder",   { fg = c.border,   bg = c.bg3 })
hi("Cursor",        { fg = c.bg2,      bg = c.fg1 })
-- hi("CursorLine",    { bg = c.line })
hi("CursorLineNr",  { fg = c.yellow2,  bold = true })
hi("LineNr",        { fg = c.fg4 })
hi("SignColumn",    { bg = c.bg2 })
hi("ColorColumn",   { bg = c.line })
hi("VertSplit",     { fg = c.bg1 })
hi("WinSeparator",  { fg = c.bg1 })
hi("StatusLine",    { fg = c.fg2,      bg = c.bg1 })
hi("StatusLineNC",  { fg = c.fg3,      bg = c.bg1 })
hi("TabLine",       { fg = c.fg3,      bg = c.bg1 })
hi("TabLineSel",    { fg = c.fg1,      bg = c.bg2,   bold = true })
hi("TabLineFill",   { bg = c.bg1 })
hi("Pmenu",         { fg = c.fg2,      bg = c.bg3 })
hi("PmenuSel",      { fg = c.bg2,      bg = c.blue2, bold = true })
hi("PmenuSbar",     { bg = c.bg1 })
hi("PmenuThumb",    { bg = c.fg4 })
hi("Visual",        { bg = c.selection })
hi("Search",        { fg = c.bg2,      bg = c.yellow2 })
hi("IncSearch",     { fg = c.bg2,      bg = c.magenta })
hi("MatchParen",    { fg = c.cyan2,    bold = true, underline = true })
hi("NonText",       { fg = c.fg4 })
hi("SpecialKey",    { fg = c.fg4 })
hi("Folded",        { fg = c.fg3,      bg = c.bg3 })
hi("FoldColumn",    { fg = c.fg4,      bg = c.bg2 })
hi("EndOfBuffer",   { fg = c.bg3 })
hi("Directory",     { fg = c.blue2,    bold = true })
hi("Title",         { fg = c.blue2,    bold = true })
hi("Question",      { fg = c.green })
hi("MoreMsg",       { fg = c.green })
hi("ModeMsg",       { fg = c.fg2,      bold = true })
hi("ErrorMsg",      { fg = c.red2,     bg = c.bg2 })
hi("WarningMsg",    { fg = c.yellow2 })
hi("SpellBad",      { undercurl = true, sp = c.red2 })
hi("SpellWarn",     { undercurl = true, sp = c.yellow2 })
hi("DiffAdd",       { bg = "#41525a" })
hi("DiffChange",    { bg = c.diff_change })
hi("DiffDelete",    { bg = c.diff_remove })
hi("DiffText",      { bg = c.diff_text })

-- ── Syntax ────────────────────────────────────────────────────────────────────
hi("Comment",       { fg = c.fg3,      italic = true })
hi("Constant",      { fg = c.yellow2 })
hi("String",        { fg = c.green })
hi("Character",     { fg = c.cyan2 })   -- quotes char color
hi("Number",        { fg = c.yellow2 })
hi("Boolean",       { fg = c.red2,     italic = true })
hi("Float",         { fg = c.yellow2 })
hi("Identifier",    { fg = c.fg2 })
hi("Function",      { fg = c.cyan2 })   -- def func name
hi("Statement",     { fg = c.magenta })
hi("Conditional",   { fg = c.magenta })
hi("Repeat",        { fg = c.magenta })
hi("Label",         { fg = c.magenta })
hi("Operator",      { fg = "#f97b58" })
hi("Keyword",       { fg = c.magenta })
hi("Exception",     { fg = c.red2 })
hi("PreProc",       { fg = c.magenta })
hi("Include",       { fg = c.magenta })
hi("Define",        { fg = c.magenta })
hi("Macro",         { fg = c.magenta })
hi("Type",          { fg = c.blue2 })
hi("StorageClass",  { fg = c.blue2 })
hi("Structure",     { fg = c.blue2 })
hi("Typedef",       { fg = c.blue2 })
hi("Special",       { fg = c.cyan2 })
hi("Delimiter",     { fg = c.fg2 })
hi("Underlined",    { underline = true })
hi("Error",         { fg = c.red2,     bold = true })
hi("Todo",          { fg = c.yellow2,  bold = true })

-- ── Treesitter ────────────────────────────────────────────────────────────────
hi("@comment",              { link = "Comment" })
hi("@string",               { fg = c.green })
hi("@string.escape",        { fg = c.cyan2 })   -- escape sequences same as quotes
hi("@character",            { fg = c.cyan2 })
hi("@number",               { fg = c.yellow2 })
hi("@float",                { fg = c.yellow2 })
hi("@boolean",              { fg = c.red2,     italic = true })
hi("@constant",             { fg = c.yellow2 })
hi("@constant.builtin",     { fg = c.red2,     italic = true })
hi("@variable",             { fg = c.fg2 })
hi("@variable.builtin",     { fg = c.red2,     italic = true })
hi("@parameter",            { fg = c.fg2,      italic = true })
hi("@function",             { fg = c.cyan2 })   -- def func name
hi("@function.builtin",     { fg = c.blue2,    italic = true, bold = true })  -- print, input, int
hi("@function.call",        { fg = c.blue2 })
hi("@method",               { fg = c.cyan2 })
hi("@method.call",          { fg = c.blue2 })
hi("@keyword",              { fg = c.magenta })
hi("@keyword.function",     { fg = c.magenta })
hi("@keyword.return",       { fg = c.magenta })
hi("@keyword.operator",     { fg = "#f97b58" })
hi("@conditional",          { fg = c.magenta })
hi("@keyword.conditional",  { fg = c.magenta })
hi("@repeat",               { fg = c.magenta })
hi("@keyword.repeat",       { fg = c.magenta })
hi("@operator",             { fg = "#f97b58" })
hi("@type",                 { fg = c.blue2 })
hi("@type.builtin",         { fg = c.blue2,    italic = true, bold = true })
hi("@field",                { fg = c.fg2 })
hi("@property",             { fg = c.fg2 })
hi("@namespace",            { fg = c.cyan2 })
hi("@include",              { fg = c.magenta })
hi("@exception",            { fg = c.red2 })
hi("@tag",                  { fg = c.cyan2 })
hi("@tag.attribute",        { fg = c.yellow2 })
hi("@tag.delimiter",        { fg = c.fg2 })
hi("@punctuation.bracket",  { fg = c.fg1 })     -- ( [ { always white
hi("@punctuation.delimiter",{ fg = c.fg2 })     -- , . normal text
hi("@punctuation.special",  { fg = c.cyan2 })
hi("@text.uri",             { fg = c.blue2,    underline = true })
hi("@text.strong",          { bold = true })
hi("@text.emphasis",        { italic = true })
hi("@text.title",           { fg = c.blue2,    bold = true })
hi("@text.literal",         { fg = c.green })
hi("@text.reference",       { fg = c.blue2 })

-- ── LSP ───────────────────────────────────────────────────────────────────────
hi("DiagnosticError",            { fg = c.red2 })
hi("DiagnosticWarn",             { fg = c.yellow2 })
hi("DiagnosticInfo",             { fg = c.blue2 })
hi("DiagnosticHint",             { fg = c.cyan2 })
hi("DiagnosticUnderlineError",   { undercurl = true, sp = c.red2 })
hi("DiagnosticUnderlineWarn",    { undercurl = true, sp = c.yellow2 })
hi("DiagnosticUnderlineInfo",    { undercurl = true, sp = c.blue2 })
hi("DiagnosticUnderlineHint",    { undercurl = true, sp = c.cyan2 })
hi("LspReferenceText",           { bg = c.selection })
hi("LspReferenceRead",           { bg = c.selection })
hi("LspReferenceWrite",          { bg = c.selection, bold = true })

-- ── Netrw ─────────────────────────────────────────────────────────────────────
hi("netrwDir",      { fg = c.cyan2,    bold = true })
hi("netrwClassify", { fg = c.cyan2,    bold = true })
