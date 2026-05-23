-- ubuntu.lua — based on terminator 'ubuntu' profile
-- bg: #200020  fg: #d0d0ff

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") then vim.cmd("syntax reset") end
vim.g.colors_name = "ubuntu"

local c = {
    bg        = "#200020",
    fg        = "#d0d0ff",
    -- palette (matches terminator ubuntu)
    black     = "#171521",
    red       = "#c01c28",
    green     = "#26a269",
    yellow    = "#a5734c",
    blue      = "#12488b",
    magenta   = "#a347ba",
    cyan      = "#2aa1b3",
    white     = "#d0d0ff",
    br_black  = "#5e5c64",
    br_red    = "#f6614f",
    br_green  = "#33da7a",
    br_yellow = "#e9ad0c",
    br_blue   = "#2a7bde",
    br_mag    = "#c061cb",
    br_cyan   = "#33c7de",
    br_white  = "#d0d0ff",
    -- extras
    none      = "NONE",
    comment   = "#7070a0",
    sel       = "#300040",
    visual    = "#3a0050",
    line      = "#280030",
    border    = "#c061cb",
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
hi("CursorLineNr",  { fg = c.br_mag,   bold = true })
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
hi("PmenuSel",      { fg = c.bg,       bg = c.br_mag, bold = true })
hi("PmenuSbar",     { bg = c.black })
hi("PmenuThumb",    { bg = c.comment })
hi("Visual",        { bg = c.visual })
hi("Search",        { fg = c.bg,       bg = c.br_yellow })
hi("IncSearch",     { fg = c.bg,       bg = c.br_mag })
hi("MatchParen",    { fg = c.br_cyan,  bold = true, underline = true })
hi("NonText",       { fg = c.comment })
hi("SpecialKey",    { fg = c.comment })
hi("Folded",        { fg = c.comment,  bg = c.line })
hi("FoldColumn",    { fg = c.comment,  bg = c.bg })
hi("EndOfBuffer",   { fg = c.black })
hi("Directory",     { fg = c.br_mag })
hi("Title",         { fg = c.br_mag,   bold = true })
hi("Question",      { fg = c.br_mag })
hi("MoreMsg",       { fg = c.magenta })
hi("ModeMsg",       { fg = c.fg,       bold = true })
hi("ErrorMsg",      { fg = c.br_red,   bg = c.bg })
hi("WarningMsg",    { fg = c.br_yellow })
hi("SpellBad",      { undercurl = true, sp = c.br_red })
hi("SpellWarn",     { undercurl = true, sp = c.br_yellow })

-- ── Syntax ────────────────────────────────────────────────────────────────────
hi("Comment",       { fg = c.comment,  italic = true })
hi("Constant",      { fg = c.br_red })
hi("String",        { fg = c.br_green })
hi("Character",     { fg = c.br_green })
hi("Number",        { fg = c.br_red })
hi("Boolean",       { fg = c.br_red })
hi("Float",         { fg = c.br_red })
hi("Identifier",    { fg = c.fg })
hi("Function",      { fg = c.br_mag,   bold = true })
hi("Statement",     { fg = c.cyan })
hi("Conditional",   { fg = c.cyan })
hi("Repeat",        { fg = c.cyan })
hi("Label",         { fg = c.cyan })
hi("Operator",      { fg = c.white })
hi("Keyword",       { fg = c.cyan,     bold = true })
hi("Exception",     { fg = c.br_red })
hi("PreProc",       { fg = c.br_mag })
hi("Include",       { fg = c.br_mag })
hi("Define",        { fg = c.br_mag })
hi("Macro",         { fg = c.br_mag })
hi("Type",          { fg = c.br_yellow })
hi("StorageClass",  { fg = c.yellow })
hi("Structure",     { fg = c.yellow })
hi("Typedef",       { fg = c.yellow })
hi("Special",       { fg = c.br_cyan })
hi("Delimiter",     { fg = c.white })
hi("Underlined",    { underline = true })
hi("Error",         { fg = c.br_red,   bold = true })
hi("Todo",          { fg = c.br_yellow, bold = true })

-- ── Treesitter ────────────────────────────────────────────────────────────────
hi("@comment",              { link = "Comment" })
hi("@string",               { link = "String" })
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
hi("@function.builtin",     { fg = c.br_mag,   italic = true })
hi("@function.call",        { fg = c.br_mag })
hi("@method",               { fg = c.br_mag })
hi("@method.call",          { fg = c.br_mag })
hi("@keyword",              { link = "Keyword" })
hi("@keyword.function",     { fg = c.cyan,     bold = true })
hi("@keyword.return",       { fg = c.cyan,     bold = true })
hi("@keyword.operator",     { fg = c.white })
hi("@conditional",          { link = "Conditional" })
hi("@repeat",               { link = "Repeat" })
hi("@operator",             { link = "Operator" })
hi("@type",                 { link = "Type" })
hi("@type.builtin",         { fg = c.yellow,   italic = true })
hi("@field",                { fg = c.br_cyan })
hi("@property",             { fg = c.br_cyan })
hi("@namespace",            { fg = c.br_mag })
hi("@include",              { link = "Include" })
hi("@exception",            { link = "Exception" })
hi("@tag",                  { fg = c.cyan })
hi("@tag.attribute",        { fg = c.br_yellow })
hi("@tag.delimiter",        { fg = c.white })
hi("@punctuation.bracket",  { fg = c.white })
hi("@punctuation.delimiter",{ fg = c.white })
hi("@punctuation.special",  { fg = c.br_cyan })
hi("@text.uri",             { fg = c.br_mag,   underline = true })
hi("@text.strong",          { bold = true })
hi("@text.emphasis",        { italic = true })
hi("@text.title",           { fg = c.br_mag,   bold = true })
hi("@text.literal",         { fg = c.br_green })
hi("@text.reference",       { fg = c.br_mag })

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
