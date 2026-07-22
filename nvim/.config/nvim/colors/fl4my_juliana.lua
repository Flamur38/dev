-- fl4my_juliana.lua
-- Standalone colorscheme using the nvim-juliana palette
-- (kaiuri/nvim-juliana — a port of Sublime Text's Mariana theme).
--
-- Same group coverage as fl4my_term.lua, so the two are drop-in swappable.
--
-- Install: ~/.config/nvim/colors/fl4my_juliana.lua
-- Load:    :colorscheme fl4my_juliana

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then
  vim.cmd("syntax reset")
end

vim.o.termguicolors = true
vim.g.colors_name = "fl4my_juliana"

-- ─── juliana / mariana palette ────────────────────────────────────────────
local c = {
  bg1          = "#444e59", -- lightest surface (pmenu sel, borders)
  bg2          = "#232a31", -- editor background (was #303841)
  bg3          = "#2e353e", -- floats, statusline, cursorline
  selection_bg = "#3f4750", -- visual selection
  diff_add     = "#41525a",
  diff_change  = "#585249",
  diff_remove  = "#4f434a",
  diff_text    = "#373f48",

  fg1          = "#ffffff", -- brightest (titles)
  fg2          = "#d8dee9", -- normal text
  fg3          = "#a6acb9", -- comments, muted
  fg4          = "#46525c", -- nontext, whitespace
  line_nr      = "#848b95", -- line numbers
  bar          = "#a5acb9", -- statusline background
  bar_nc       = "#8b929e", -- statusline background (inactive)
  bar_fg       = "#141a1f", -- statusline text
  text_fg      = "#d9d9d9",

  blue1        = "#95b2d6", -- soft blue
  blue2        = "#5c99d6", -- functions
  cyan1        = "#87c7c7", -- soft cyan
  cyan2        = "#5fb4b4", -- operators, builtins
  green        = "#99c794", -- strings
  magenta      = "#c695c6", -- keywords
  orange       = "#f97b58", -- numbers, constants
  red1         = "#c76b70",
  red2         = "#ec5f66", -- errors
  yellow1      = "#fac761", -- types
  yellow2      = "#f9ae58", -- search, warnings
  yellow3      = "#ee932b",
}

local function hl(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- ─── editor ui ────────────────────────────────────────────────────────────
hl("Normal",        { fg = c.fg2, bg = c.bg2 })
hl("NormalNC",      { fg = c.fg2, bg = c.bg2 })
hl("NormalFloat",   { fg = c.fg2, bg = c.bg3 })
hl("FloatBorder",   { fg = c.cyan2, bg = c.bg3 })
hl("FloatTitle",    { fg = c.yellow2, bg = c.bg3, bold = true })
hl("ColorColumn",   { bg = c.bg3 })
hl("Cursor",        { fg = c.bg2, bg = c.fg2 })
hl("lCursor",       { fg = c.bg2, bg = c.fg2 })
hl("CursorIM",      { fg = c.bg2, bg = c.fg2 })
hl("TermCursor",    { fg = c.bg2, bg = c.cyan2 })
hl("CursorLine",    { bg = c.bg3 })
hl("CursorColumn",  { bg = c.bg3 })
hl("CursorLineNr",  { fg = c.yellow2, bold = true })
hl("LineNr",        { fg = c.line_nr })
hl("LineNrAbove",   { fg = c.line_nr })
hl("LineNrBelow",   { fg = c.line_nr })
hl("SignColumn",    { fg = c.fg4, bg = c.bg2 })
hl("Visual",        { bg = c.selection_bg })
hl("VisualNOS",     { bg = c.selection_bg })
hl("Search",        { fg = c.bg2, bg = c.yellow2 })
hl("IncSearch",     { fg = c.bg2, bg = c.orange })
hl("CurSearch",     { fg = c.bg2, bg = c.orange })
hl("Substitute",    { fg = c.bg2, bg = c.red2 })
hl("MatchParen",    { fg = c.yellow2, bg = c.bg1, bold = true })
hl("NonText",       { fg = c.fg4 })
hl("Whitespace",    { fg = c.fg4 })
hl("SpecialKey",    { fg = c.fg4 })
hl("EndOfBuffer",   { fg = c.bg2 })
hl("Folded",        { fg = c.cyan2, bg = c.bg3 })
hl("FoldColumn",    { fg = c.fg4, bg = c.bg2 })
hl("Pmenu",         { fg = c.fg2, bg = c.bg3 })
hl("PmenuSel",      { fg = c.fg1, bg = c.bg1, bold = true })
hl("PmenuSbar",     { bg = c.bg3 })
hl("PmenuThumb",    { bg = c.bg1 })
hl("WildMenu",      { fg = c.bg2, bg = c.blue2 })
hl("StatusLine",    { fg = c.bar_fg, bg = c.bar })
hl("StatusLineNC",  { fg = c.bar_fg, bg = c.bar_nc })
hl("TabLine",       { fg = c.fg3, bg = c.bg3 })
hl("TabLineSel",    { fg = c.yellow2, bg = c.bg2, bold = true })
hl("TabLineFill",   { bg = c.bg3 })
hl("WinSeparator",  { fg = c.bg1 })
hl("VertSplit",     { fg = c.bg1 })
hl("WinBar",        { fg = c.fg2, bg = c.bg2 })
hl("WinBarNC",      { fg = c.fg3, bg = c.bg2 })
hl("Title",         { fg = c.fg1, bold = true })
hl("Directory",     { fg = c.blue2 })
hl("ErrorMsg",      { fg = c.red2 })
hl("WarningMsg",    { fg = c.yellow2 })
hl("ModeMsg",       { fg = c.green })
hl("MoreMsg",       { fg = c.green })
hl("Question",      { fg = c.green })
hl("MsgArea",       { fg = c.fg2 })
hl("MsgSeparator",  { fg = c.bg1 })
hl("Conceal",       { fg = c.fg3 })
hl("QuickFixLine",  { bg = c.selection_bg })
hl("debugPC",       { bg = c.selection_bg })
hl("debugBreakpoint", { fg = c.red2, bg = c.bg2 })

-- ─── legacy syntax ────────────────────────────────────────────────────────
hl("Comment",       { fg = c.fg3, italic = true })
hl("Constant",      { fg = c.orange })
hl("String",        { fg = c.green })
hl("Character",     { fg = c.green })
hl("Number",        { fg = c.yellow2 })
hl("Boolean",       { fg = c.red2 })
hl("Float",         { fg = c.yellow2 })
hl("Identifier",    { fg = c.fg2 })
hl("Function",      { fg = c.blue2 })
hl("Statement",     { fg = c.magenta })
hl("Conditional",   { fg = c.magenta })
hl("Repeat",        { fg = c.magenta })
hl("Label",         { fg = c.magenta })
hl("Operator",      { fg = c.orange })
hl("Keyword",       { fg = c.magenta })
hl("Exception",     { fg = c.magenta })
hl("PreProc",       { fg = c.magenta })
hl("Include",       { fg = c.magenta })
hl("Define",        { fg = c.magenta })
hl("Macro",         { fg = c.cyan2 })
hl("PreCondit",     { fg = c.magenta })
hl("Type",          { fg = c.yellow1 })
hl("StorageClass",  { fg = c.magenta })
hl("Structure",     { fg = c.yellow1 })
hl("Typedef",       { fg = c.yellow1 })
hl("Special",       { fg = c.cyan2 })
hl("SpecialChar",   { fg = c.orange })
hl("Tag",           { fg = c.red1 })
hl("Delimiter",     { fg = c.fg2 })
hl("SpecialComment",{ fg = c.cyan1, italic = true })
hl("Debug",         { fg = c.red2 })
hl("Underlined",    { underline = true })
hl("Ignore",        { fg = c.fg4 })
hl("Error",         { fg = c.red2 })
hl("Todo",          { fg = c.bg2, bg = c.yellow2, bold = true })

-- ─── treesitter ───────────────────────────────────────────────────────────
hl("@comment",              { fg = c.fg3, italic = true })
hl("@comment.todo",         { fg = c.bg2, bg = c.yellow2, bold = true })
hl("@comment.error",        { fg = c.bg2, bg = c.red2, bold = true })
hl("@comment.warning",      { fg = c.bg2, bg = c.yellow2, bold = true })
hl("@comment.note",         { fg = c.bg2, bg = c.cyan2, bold = true })

hl("@variable",             { fg = c.fg2 })
hl("@variable.builtin",     { fg = c.red1, italic = true })
hl("@variable.parameter",   { fg = c.fg2, italic = true })
hl("@variable.member",      { fg = c.fg2 })

hl("@constant",             { fg = c.orange })
hl("@constant.builtin",     { fg = c.orange })
hl("@constant.macro",       { fg = c.orange })

hl("@module",               { fg = c.yellow1 })
hl("@module.builtin",       { fg = c.yellow1 })
hl("@label",                { fg = c.magenta })

hl("@string",               { fg = c.green })
hl("@string.documentation", { fg = c.fg3 })
hl("@string.escape",        { fg = c.orange })
hl("@string.regexp",        { fg = c.cyan1 })
hl("@string.special",       { fg = c.cyan2 })
hl("@character",            { fg = c.green })
hl("@character.special",    { fg = c.orange })

hl("@number",               { fg = c.yellow2 })
hl("@number.float",         { fg = c.yellow2 })
hl("@boolean",              { fg = c.red2 })

hl("@function",             { fg = c.blue2 })
hl("@function.builtin",     { fg = c.blue2 })
hl("@function.call",        { fg = c.blue2 })
hl("@function.macro",       { fg = c.cyan2 })
hl("@function.method",      { fg = c.cyan2 })
hl("@function.method.call", { fg = c.cyan2 })
hl("@constructor",          { fg = c.yellow1 })

hl("@keyword",              { fg = c.magenta })
hl("@keyword.function",     { fg = c.magenta })
hl("@keyword.operator",     { fg = c.orange })
hl("@keyword.return",       { fg = c.magenta })
hl("@keyword.import",       { fg = c.magenta })
hl("@keyword.exception",    { fg = c.magenta })
hl("@keyword.conditional",  { fg = c.magenta })
hl("@keyword.repeat",       { fg = c.magenta })

hl("@operator",             { fg = c.orange })
hl("@punctuation.delimiter",{ fg = c.fg2 })
hl("@punctuation.bracket",  { fg = c.fg2 })
hl("@punctuation.special",  { fg = c.cyan2 })

hl("@type",                 { fg = c.yellow1 })
hl("@type.builtin",         { fg = c.yellow1 })
hl("@type.definition",      { fg = c.yellow1 })
hl("@attribute",            { fg = c.cyan2 })
hl("@property",             { fg = c.fg2 })
hl("@field",                { fg = c.fg2 })

hl("@tag",                  { fg = c.red1 })
hl("@tag.attribute",        { fg = c.yellow1 })
hl("@tag.delimiter",        { fg = c.fg3 })

-- markup (markdown / render-markdown.nvim)
hl("@markup.heading",       { fg = c.yellow2, bold = true })
hl("@markup.strong",        { fg = c.orange, bold = true })
hl("@markup.italic",        { fg = c.magenta, italic = true })
hl("@markup.strikethrough", { fg = c.fg3, strikethrough = true })
hl("@markup.raw",           { fg = c.green })
hl("@markup.raw.block",     { fg = c.fg2 })
hl("@markup.link",          { fg = c.blue2, underline = true })
hl("@markup.link.label",    { fg = c.cyan2 })
hl("@markup.list",          { fg = c.cyan2 })
hl("@markup.quote",         { fg = c.fg3, italic = true })

-- ─── diagnostics / lsp ────────────────────────────────────────────────────
hl("DiagnosticError",            { fg = c.red2 })
hl("DiagnosticWarn",             { fg = c.yellow2 })
hl("DiagnosticInfo",             { fg = c.blue2 })
hl("DiagnosticHint",             { fg = c.cyan2 })
hl("DiagnosticOk",               { fg = c.green })
hl("DiagnosticVirtualTextError", { fg = c.red2,    bg = c.bg3 })
hl("DiagnosticVirtualTextWarn",  { fg = c.yellow2, bg = c.bg3 })
hl("DiagnosticVirtualTextInfo",  { fg = c.blue2,   bg = c.bg3 })
hl("DiagnosticVirtualTextHint",  { fg = c.cyan2,   bg = c.bg3 })
hl("DiagnosticUnderlineError",   { undercurl = true, sp = c.red2 })
hl("DiagnosticUnderlineWarn",    { undercurl = true, sp = c.yellow2 })
hl("DiagnosticUnderlineInfo",    { undercurl = true, sp = c.blue2 })
hl("DiagnosticUnderlineHint",    { undercurl = true, sp = c.cyan2 })
hl("DiagnosticUnnecessary",      { fg = c.fg4 })
hl("LspReferenceText",           { bg = c.bg1 })
hl("LspReferenceRead",           { bg = c.bg1 })
hl("LspReferenceWrite",          { bg = c.bg1 })
hl("LspInlayHint",               { fg = c.fg4, bg = c.bg3, italic = true })
hl("LspSignatureActiveParameter",{ fg = c.yellow2, bold = true })
hl("LspCodeLens",                { fg = c.fg3 })

-- ─── git / diff ───────────────────────────────────────────────────────────
hl("DiffAdd",       { bg = c.diff_add })
hl("DiffChange",    { bg = c.diff_change })
hl("DiffDelete",    { bg = c.diff_remove })
hl("DiffText",      { bg = c.diff_text })
hl("diffAdded",     { fg = c.green })
hl("diffRemoved",   { fg = c.red2 })
hl("diffChanged",   { fg = c.blue2 })
hl("diffFile",      { fg = c.cyan2 })
hl("diffLine",      { fg = c.magenta })
hl("GitSignsAdd",       { fg = c.green })
hl("GitSignsChange",    { fg = c.blue2 })
hl("GitSignsDelete",    { fg = c.red2 })
hl("GitSignsAddNr",     { fg = c.green })
hl("GitSignsChangeNr",  { fg = c.blue2 })
hl("GitSignsDeleteNr",  { fg = c.red2 })

-- ─── spell ────────────────────────────────────────────────────────────────
hl("SpellBad",   { undercurl = true, sp = c.red2 })
hl("SpellCap",   { undercurl = true, sp = c.yellow2 })
hl("SpellRare",  { undercurl = true, sp = c.magenta })
hl("SpellLocal", { undercurl = true, sp = c.cyan2 })

-- ─── telescope ────────────────────────────────────────────────────────────
hl("TelescopeNormal",        { fg = c.fg2, bg = c.bg3 })
hl("TelescopeBorder",        { fg = c.bg1, bg = c.bg3 })
hl("TelescopePromptNormal",  { fg = c.fg2, bg = c.bg1 })
hl("TelescopePromptBorder",  { fg = c.bg1, bg = c.bg1 })
hl("TelescopePromptTitle",   { fg = c.bg2, bg = c.yellow2, bold = true })
hl("TelescopePromptPrefix",  { fg = c.cyan2, bg = c.bg1 })
hl("TelescopeResultsTitle",  { fg = c.bg2, bg = c.blue2, bold = true })
hl("TelescopePreviewTitle",  { fg = c.bg2, bg = c.green, bold = true })
hl("TelescopeSelection",     { fg = c.fg1, bg = c.selection_bg, bold = true })
hl("TelescopeSelectionCaret",{ fg = c.yellow2, bg = c.selection_bg })
hl("TelescopeMatching",      { fg = c.yellow2, bold = true })
hl("TelescopeMultiSelection",{ fg = c.cyan2 })

-- ─── harpoon ──────────────────────────────────────────────────────────────
hl("HarpoonWindow", { fg = c.fg2, bg = c.bg3 })
hl("HarpoonBorder", { fg = c.bg1, bg = c.bg3 })
hl("HarpoonTitle",  { fg = c.yellow2, bold = true })

-- ─── nvim-cmp ─────────────────────────────────────────────────────────────
hl("CmpItemAbbr",            { fg = c.fg2 })
hl("CmpItemAbbrDeprecated",  { fg = c.fg3, strikethrough = true })
hl("CmpItemAbbrMatch",       { fg = c.yellow2, bold = true })
hl("CmpItemAbbrMatchFuzzy",  { fg = c.yellow2 })
hl("CmpItemMenu",            { fg = c.fg3, italic = true })
hl("CmpItemKindText",        { fg = c.fg2 })
hl("CmpItemKindFunction",    { fg = c.blue2 })
hl("CmpItemKindMethod",      { fg = c.cyan2 })
hl("CmpItemKindConstructor", { fg = c.yellow1 })
hl("CmpItemKindVariable",    { fg = c.fg2 })
hl("CmpItemKindField",       { fg = c.fg2 })
hl("CmpItemKindProperty",    { fg = c.fg2 })
hl("CmpItemKindClass",       { fg = c.yellow1 })
hl("CmpItemKindStruct",      { fg = c.yellow1 })
hl("CmpItemKindInterface",   { fg = c.yellow1 })
hl("CmpItemKindModule",      { fg = c.magenta })
hl("CmpItemKindKeyword",     { fg = c.magenta })
hl("CmpItemKindConstant",    { fg = c.orange })
hl("CmpItemKindValue",       { fg = c.orange })
hl("CmpItemKindEnum",        { fg = c.yellow1 })
hl("CmpItemKindSnippet",     { fg = c.cyan2 })
hl("CmpItemKindFile",        { fg = c.blue1 })
hl("CmpItemKindFolder",      { fg = c.blue1 })
hl("CmpItemKindColor",       { fg = c.red1 })

-- ─── render-markdown.nvim ─────────────────────────────────────────────────
hl("RenderMarkdownH1",     { fg = c.yellow2, bold = true })
hl("RenderMarkdownH2",     { fg = c.blue2, bold = true })
hl("RenderMarkdownH3",     { fg = c.cyan2, bold = true })
hl("RenderMarkdownH4",     { fg = c.green, bold = true })
hl("RenderMarkdownH5",     { fg = c.magenta, bold = true })
hl("RenderMarkdownH6",     { fg = c.orange, bold = true })
hl("RenderMarkdownH1Bg",   { fg = c.yellow2, bg = c.bg3 })
hl("RenderMarkdownH2Bg",   { fg = c.blue2, bg = c.bg3 })
hl("RenderMarkdownH3Bg",   { fg = c.cyan2, bg = c.bg3 })
hl("RenderMarkdownH4Bg",   { fg = c.green, bg = c.bg3 })
hl("RenderMarkdownH5Bg",   { fg = c.magenta, bg = c.bg3 })
hl("RenderMarkdownH6Bg",   { fg = c.orange, bg = c.bg3 })
hl("RenderMarkdownCode",   { bg = c.bg3 })
hl("RenderMarkdownCodeInline", { fg = c.green, bg = c.bg3 })
hl("RenderMarkdownBullet", { fg = c.cyan2 })
hl("RenderMarkdownDash",   { fg = c.fg4 })
hl("RenderMarkdownQuote",  { fg = c.fg3 })
hl("RenderMarkdownLink",   { fg = c.blue2, underline = true })
hl("RenderMarkdownTableHead", { fg = c.cyan2 })
hl("RenderMarkdownTableRow",  { fg = c.fg2 })

-- ─── indent-blankline ─────────────────────────────────────────────────────
hl("IblIndent",     { fg = c.bg1 })
hl("IblScope",      { fg = c.fg4 })

-- ─── juliana statusline extras ────────────────────────────────────────────
hl("StatusBlack",   { fg = c.fg3 })
hl("StatusRed",     { fg = c.red2 })
hl("StatusGreen",   { fg = c.green })
hl("StatusYellow",  { fg = c.yellow2 })
hl("StatusBlue",    { fg = c.blue2 })
hl("StatusMagenta", { fg = c.magenta })
hl("StatusCyan",    { fg = c.cyan2 })
hl("StatusWhite",   { fg = c.fg2 })
hl("StatusOrange",  { fg = c.orange })

-- ─── :terminal palette ────────────────────────────────────────────────────
vim.g.terminal_color_0  = c.bg2
vim.g.terminal_color_1  = c.red2
vim.g.terminal_color_2  = c.green
vim.g.terminal_color_3  = c.yellow2
vim.g.terminal_color_4  = c.blue2
vim.g.terminal_color_5  = c.magenta
vim.g.terminal_color_6  = c.cyan2
vim.g.terminal_color_7  = c.fg2
vim.g.terminal_color_8  = c.fg4
vim.g.terminal_color_9  = c.red1
vim.g.terminal_color_10 = c.green
vim.g.terminal_color_11 = c.yellow1
vim.g.terminal_color_12 = c.blue1
vim.g.terminal_color_13 = c.magenta
vim.g.terminal_color_14 = c.cyan1
vim.g.terminal_color_15 = c.fg1
