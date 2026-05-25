-- black.lua — based on terminator 'default' profile
-- bg: #000000  fg: system default (white-ish)

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") then vim.cmd("syntax reset") end
vim.g.colors_name = "black"

local c = {
    bg        = "#000000",
    fg        = "#d0cfcc",
    -- palette (matches terminator default)
    black     = "#171521",
    red       = "#c01c28",
    green     = "#26a269",
    yellow    = "#a5734c",
    blue      = "#12488b",
    magenta   = "#a347ba",
    cyan      = "#2aa1b3",
    white     = "#d0cfcc",
    br_black  = "#5e5c64",
    br_red    = "#f6614f",
    br_green  = "#33da7a",
    br_yellow = "#e9ad0c",
    br_blue   = "#2a7bde",
    br_mag    = "#c061cb",
    br_cyan   = "#33c7de",
    br_white  = "#cdd8da",
    -- extras
    none      = "NONE",
    comment   = "#5e5c64",
    sel       = "#171521",
    visual    = "#12488b",
    line      = "#0d0d0d",
    border    = "#2aa1b3",
}

local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
end

-- ── Core ──────────────────────────────────────────────────────────────────────
hi("Normal",        { fg = c.fg,       bg = c.bg })
hi("NormalFloat",   { fg = c.fg,       bg = c.black })
hi("FloatBorder",   { fg = c.border,   bg = c.black })
hi("Cursor",        { fg = c.bg,       bg = c.fg })
hi("CursorLine",    { bg = c.line })
hi("CursorLineNr",  { fg = c.br_green, bold = true })
hi("LineNr",        { fg = c.comment })
hi("SignColumn",    { bg = c.bg })
hi("ColorColumn",   { bg = c.line })
hi("VertSplit",     { fg = c.border })
hi("WinSeparator",  { fg = c.border })
hi("StatusLine",    { fg = c.fg,       bg = c.black })
hi("StatusLineNC",  { fg = c.comment,  bg = c.black })
hi("TabLine",       { fg = c.comment,  bg = c.black })
hi("TabLineSel",    { fg = c.fg,       bg = c.bg,    bold = true })
hi("TabLineFill",   { bg = c.black })
hi("Pmenu",         { fg = c.fg,       bg = c.black })
hi("PmenuSel",      { fg = c.bg,       bg = c.br_green, bold = true })
hi("PmenuSbar",     { bg = c.black })
hi("PmenuThumb",    { bg = c.comment })
hi("Visual",        { bg = c.visual })
hi("Search",        { fg = c.bg,       bg = c.br_yellow })
hi("IncSearch",     { fg = c.bg,       bg = c.br_green })
hi("MatchParen",    { fg = c.br_cyan,  bold = true, underline = true })
hi("NonText",       { fg = c.comment })
hi("SpecialKey",    { fg = c.comment })
hi("Folded",        { fg = c.comment,  bg = c.line })
hi("FoldColumn",    { fg = c.comment,  bg = c.bg })
hi("EndOfBuffer",   { fg = c.black })
hi("Directory",     { fg = c.br_blue })
hi("Title",         { fg = c.br_green, bold = true })
hi("Question",      { fg = c.br_green })
hi("MoreMsg",       { fg = c.green })
hi("ModeMsg",       { fg = c.fg,       bold = true })
hi("ErrorMsg",      { fg = c.br_red,   bg = c.bg })
hi("WarningMsg",    { fg = c.br_yellow })
hi("SpellBad",      { undercurl = true, sp = c.br_red })
hi("SpellWarn",     { undercurl = true, sp = c.br_yellow })

-- ── Syntax ────────────────────────────────────────────────────────────────────
hi("Comment",       { fg = c.comment,  italic = true })
hi("Constant",      { fg = c.br_red })
hi("String",        { fg = "#a5734c" })
hi("Character",     { fg = c.br_green })
hi("Number",        { fg = c.br_red })
hi("Boolean",       { fg = c.br_red })
hi("Float",         { fg = c.br_red })
hi("Identifier",    { fg = c.fg })
hi("Function",      { fg = c.br_blue,  bold = true })
hi("Statement",     { fg = c.cyan })
hi("Conditional",   { fg = c.br_green })
hi("Repeat",        { fg = c.br_green })
hi("Label",         { fg = c.cyan })
hi("Operator",      { fg = "#6a7a8f" })
hi("Keyword",       { fg = c.cyan,     bold = true })
hi("Exception",     { fg = c.br_red })
hi("PreProc",       { fg = c.magenta })
hi("Include",       { fg = c.magenta })
hi("Define",        { fg = c.magenta })
hi("Macro",         { fg = c.magenta })
hi("Type",          { fg = c.cyan,     bold = true })
hi("StorageClass",  { fg = c.cyan,     bold = true })
hi("Structure",     { fg = c.yellow })
hi("Typedef",       { fg = c.yellow })
hi("Special",       { fg = c.br_cyan })
hi("Delimiter",     { fg = "#6a7a8f" })
hi("Underlined",    { underline = true })
hi("Error",         { fg = c.br_red,   bold = true })
hi("Todo",          { fg = c.br_yellow, bold = true })

-- ── Treesitter ────────────────────────────────────────────────────────────────
hi("@comment",              { link = "Comment" })
hi("@string",               { fg = "#a5734c" })
hi("@string.escape",        { fg = c.br_cyan })
hi("@character",            { link = "Character" })
hi("@number",               { link = "Number" })
hi("@float",                { link = "Float" })
hi("@boolean",              { link = "Boolean" })
hi("@constant",             { fg = c.br_red })
hi("@constant.builtin",     { fg = c.br_red,   italic = true })
hi("@variable",             { fg = c.fg })
hi("@variable.builtin",     { fg = c.br_red,   italic = true })
hi("@parameter",            { fg = c.fg,       italic = true })
hi("@function",             { link = "Function" })
hi("@function.builtin",     { fg = c.cyan,     bold = true })
hi("@function.call",        { fg = c.br_blue })
hi("@method",               { fg = c.br_blue })
hi("@method.call",          { fg = c.br_blue })
hi("@keyword",              { link = "Keyword" })
hi("@keyword.function",     { fg = c.cyan,     bold = true })
hi("@keyword.return",       { fg = c.cyan,     bold = true })
hi("@keyword.operator",     { fg = "#6a7a8f" })
hi("@conditional",          { fg = c.br_green })
hi("@keyword.conditional",  { fg = c.br_green })
hi("@repeat",               { fg = c.br_green })
hi("@keyword.repeat",       { fg = c.br_green })
hi("@operator",             { fg = "#6a7a8f" })
hi("@type",                 { fg = c.cyan,     bold = true })
hi("@type.builtin",         { fg = c.cyan,     bold = true })
hi("@field",                { fg = c.br_cyan })
hi("@property",             { fg = c.br_cyan })
hi("@namespace",            { fg = c.magenta })
hi("@include",              { link = "Include" })
hi("@exception",            { link = "Exception" })
hi("@tag",                  { fg = c.cyan })
hi("@tag.attribute",        { fg = c.br_yellow })
hi("@tag.delimiter",        { fg = "#6a7a8f" })
hi("@punctuation.bracket",  { fg = "#6a7a8f" })
hi("@punctuation.delimiter",{ fg = "#6a7a8f" })
hi("@punctuation.special",  { fg = c.br_cyan })
hi("@text.uri",             { fg = c.br_blue,  underline = true })
hi("@text.strong",          { bold = true })
hi("@text.emphasis",        { italic = true })
hi("@text.title",           { fg = c.br_green, bold = true })
hi("@text.literal",         { fg = c.br_green })
hi("@text.reference",       { fg = c.br_blue })

-- ── LSP ───────────────────────────────────────────────────────────────────────
hi("DiagnosticError",            { fg = c.br_red })
hi("DiagnosticWarn",             { fg = c.br_yellow })
hi("DiagnosticInfo",             { fg = c.br_blue })
hi("DiagnosticHint",             { fg = c.br_cyan })
hi("DiagnosticUnderlineError",   { undercurl = true, sp = c.br_red })
hi("DiagnosticUnderlineWarn",    { undercurl = true, sp = c.br_yellow })
hi("DiagnosticUnderlineInfo",    { undercurl = true, sp = c.br_blue })
hi("DiagnosticUnderlineHint",    { undercurl = true, sp = c.br_cyan })
hi("LspReferenceText",           { bg = c.sel })
hi("LspReferenceRead",           { bg = c.sel })
hi("LspReferenceWrite",          { bg = c.sel, bold = true })

-- ── Netrw ─────────────────────────────────────────────────────────────────────
hi("netrwDir",      { fg = c.br_cyan,  bold = true })
hi("netrwClassify", { fg = c.br_cyan,  bold = true })
