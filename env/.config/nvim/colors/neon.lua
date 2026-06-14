-- flamy_neon.lua
-- Neon colorscheme for Neovim by fl4mys3c
-- ~/.config/nvim/colors/flamy_neon.lua

vim.cmd("hi clear")
if vim.fn.exists("syntax_on") then
  vim.cmd("syntax reset")
end
vim.g.colors_name = "flamy_neon"
vim.opt.termguicolors = true

local c = {
  -- Base
  bg          = "#0a0a0f",
  bg_dim      = "#0f0f1a",
  bg_mid      = "#141420",
  bg_high     = "#1c1c2e",
  bg_sel      = "#1e1e35",
  border      = "#2a2a45",
  comment     = "#3d3d6b",

  -- Foreground
  fg          = "#e0e0ff",
  fg_dim      = "#9090c0",
  fg_dark     = "#5a5a8a",

  -- Neon palette
  neon_pink   = "#ff00aa",
  neon_cyan   = "#00ffee",
  neon_green  = "#39ff14",
  neon_yellow = "#ffee00",
  neon_orange = "#ff6600",
  neon_purple = "#bf00ff",
  neon_blue   = "#0080ff",
  neon_red    = "#ff0055",

  -- Softer variants (readability)
  soft_pink   = "#ff66cc",
  soft_cyan   = "#66ffee",
  soft_green  = "#88ff55",
  soft_yellow = "#ffee66",
  soft_purple = "#cc66ff",
  soft_blue   = "#66aaff",
  soft_red    = "#ff4477",

  -- UI tones
  gutter      = "#1a1a2e",
  line_hi     = "#12122a",
  visual      = "#2a0a3a",
  search_bg   = "#003333",
  err_bg      = "#2a0010",
  warn_bg     = "#1a1200",
  info_bg     = "#001a2a",
  hint_bg     = "#001a10",

  none        = "NONE",
}

local function hi(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- ─── Editor ────────────────────────────────────────────────────────────────
hi("Normal",          { fg = c.fg,          bg = c.bg })
hi("NormalFloat",     { fg = c.fg,          bg = c.bg_mid })
hi("NormalNC",        { fg = c.fg_dim,      bg = c.bg_dim })
hi("SignColumn",      { fg = c.fg_dark,     bg = c.bg })
hi("ColorColumn",     {                     bg = c.bg_mid })
hi("CursorLine",      {                     bg = c.line_hi })
hi("CursorColumn",    {                     bg = c.line_hi })
hi("CursorLineNr",    { fg = c.neon_cyan,   bg = c.bg,       bold = true })
hi("LineNr",          { fg = c.comment,     bg = c.bg })
hi("EndOfBuffer",     { fg = c.bg_high })
hi("VertSplit",       { fg = c.border,      bg = c.bg })
hi("WinSeparator",    { fg = c.border,      bg = c.bg })
hi("Folded",          { fg = c.fg_dim,      bg = c.bg_high })
hi("FoldColumn",      { fg = c.comment,     bg = c.bg })
hi("Conceal",         { fg = c.fg_dark })
hi("MatchParen",      { fg = c.neon_green,  bg = c.none,     bold = true, underline = true })

-- ─── Cursor / Visual ───────────────────────────────────────────────────────
hi("Cursor",          { fg = c.bg,          bg = c.neon_cyan })
hi("CursorIM",        { fg = c.bg,          bg = c.neon_pink })
hi("TermCursor",      { fg = c.bg,          bg = c.neon_green })
hi("Visual",          {                     bg = c.visual })
hi("VisualNOS",       {                     bg = c.visual })

-- ─── Search ────────────────────────────────────────────────────────────────
hi("Search",          { fg = c.neon_yellow, bg = c.search_bg, bold = true })
hi("IncSearch",       { fg = c.bg,          bg = c.neon_yellow, bold = true })
hi("CurSearch",       { fg = c.bg,          bg = c.neon_cyan,   bold = true })
hi("Substitute",      { fg = c.bg,          bg = c.neon_pink })

-- ─── Statusline ────────────────────────────────────────────────────────────
hi("StatusLine",      { fg = c.neon_cyan,   bg = c.bg_high })
hi("StatusLineNC",    { fg = c.fg_dark,     bg = c.bg_mid })
hi("WinBar",          { fg = c.soft_cyan,   bg = c.bg_mid })
hi("WinBarNC",        { fg = c.fg_dark,     bg = c.bg_dim })

-- ─── Tabline ───────────────────────────────────────────────────────────────
hi("TabLine",         { fg = c.fg_dim,      bg = c.bg_high })
hi("TabLineSel",      { fg = c.neon_cyan,   bg = c.bg,       bold = true })
hi("TabLineFill",     {                     bg = c.bg_high })

-- ─── Popup / Menu ──────────────────────────────────────────────────────────
hi("Pmenu",           { fg = c.fg,          bg = c.bg_mid })
hi("PmenuSel",        { fg = c.bg,          bg = c.neon_cyan,  bold = true })
hi("PmenuSbar",       {                     bg = c.bg_high })
hi("PmenuThumb",      {                     bg = c.neon_purple })
hi("PmenuKind",       { fg = c.neon_purple, bg = c.bg_mid })
hi("PmenuKindSel",    { fg = c.bg,          bg = c.neon_cyan })
hi("PmenuExtra",      { fg = c.fg_dark,     bg = c.bg_mid })
hi("PmenuExtraSel",   { fg = c.bg_dim,      bg = c.neon_cyan })
hi("FloatBorder",     { fg = c.neon_purple, bg = c.bg_mid })
hi("FloatTitle",      { fg = c.neon_cyan,   bg = c.bg_mid,   bold = true })

-- ─── Messages ──────────────────────────────────────────────────────────────
hi("ModeMsg",         { fg = c.neon_green,  bold = true })
hi("MsgArea",         { fg = c.fg_dim })
hi("MoreMsg",         { fg = c.neon_cyan })
hi("Question",        { fg = c.neon_yellow })
hi("ErrorMsg",        { fg = c.neon_red,    bold = true })
hi("WarningMsg",      { fg = c.neon_orange, bold = true })

-- ─── Diff ──────────────────────────────────────────────────────────────────
hi("DiffAdd",         { fg = c.neon_green,                   bg = "#001a00" })
hi("DiffChange",      { fg = c.neon_yellow,                  bg = "#1a1200" })
hi("DiffDelete",      { fg = c.neon_red,                     bg = "#1a0010" })
hi("DiffText",        { fg = c.bg,          bg = c.neon_yellow, bold = true })
hi("Added",           { fg = c.neon_green })
hi("Changed",         { fg = c.neon_yellow })
hi("Removed",         { fg = c.neon_red })

-- ─── Spelling ──────────────────────────────────────────────────────────────
hi("SpellBad",        { sp = c.neon_red,    undercurl = true })
hi("SpellCap",        { sp = c.neon_yellow, undercurl = true })
hi("SpellLocal",      { sp = c.neon_cyan,   undercurl = true })
hi("SpellRare",       { sp = c.neon_purple, undercurl = true })

-- ─── Syntax ────────────────────────────────────────────────────────────────
hi("Comment",         { fg = c.comment,     italic = true })
hi("Constant",        { fg = c.neon_orange })
hi("String",          { fg = c.soft_green })
hi("Character",       { fg = c.neon_green })
hi("Number",          { fg = c.neon_orange })
hi("Boolean",         { fg = c.neon_pink,   bold = true })
hi("Float",           { fg = c.neon_orange })
hi("Identifier",      { fg = c.fg })
hi("Function",        { fg = c.neon_cyan,   bold = true })
hi("Statement",       { fg = c.neon_pink,   bold = true })
hi("Conditional",     { fg = c.neon_pink })
hi("Repeat",          { fg = c.neon_pink })
hi("Label",           { fg = c.soft_purple })
hi("Operator",        { fg = c.neon_cyan })
hi("Keyword",         { fg = c.neon_pink,   bold = true })
hi("Exception",       { fg = c.soft_red,    bold = true })
hi("PreProc",         { fg = c.neon_yellow })
hi("Include",         { fg = c.soft_yellow })
hi("Define",          { fg = c.neon_yellow })
hi("Macro",           { fg = c.neon_yellow })
hi("PreCondit",       { fg = c.soft_yellow })
hi("Type",            { fg = c.neon_blue,   bold = true })
hi("StorageClass",    { fg = c.soft_blue })
hi("Structure",       { fg = c.neon_blue })
hi("Typedef",         { fg = c.soft_blue,   italic = true })
hi("Special",         { fg = c.neon_purple })
hi("SpecialChar",     { fg = c.soft_purple })
hi("Tag",             { fg = c.neon_cyan })
hi("Delimiter",       { fg = c.fg_dim })
hi("SpecialComment",  { fg = c.soft_cyan,   italic = true })
hi("Debug",           { fg = c.neon_red })
hi("Underlined",      { fg = c.soft_blue,   underline = true })
hi("Ignore",          { fg = c.fg_dark })
hi("Error",           { fg = c.neon_red,    bg = c.err_bg,   bold = true })
hi("Todo",            { fg = c.bg,          bg = c.neon_yellow, bold = true })

-- ─── Treesitter ────────────────────────────────────────────────────────────
-- Variables
hi("@variable",               { fg = c.fg })
hi("@variable.builtin",       { fg = c.soft_pink,   italic = true })
hi("@variable.parameter",     { fg = c.soft_yellow })
hi("@variable.member",        { fg = c.soft_cyan })

-- Constants
hi("@constant",               { fg = c.neon_orange })
hi("@constant.builtin",       { fg = c.neon_orange, bold = true })
hi("@constant.macro",         { fg = c.neon_yellow })

-- Strings
hi("@string",                 { fg = c.soft_green })
hi("@string.escape",          { fg = c.neon_green,  bold = true })
hi("@string.special",         { fg = c.soft_purple })
hi("@string.special.path",    { fg = c.soft_cyan,   underline = true })
hi("@string.special.url",     { fg = c.neon_cyan,   underline = true })
hi("@string.regexp",          { fg = c.neon_green })

-- Characters / numbers
hi("@character",              { fg = c.neon_green })
hi("@character.special",      { fg = c.soft_purple })
hi("@number",                 { fg = c.neon_orange })
hi("@number.float",           { fg = c.neon_orange })
hi("@boolean",                { fg = c.neon_pink,   bold = true })

-- Functions
hi("@function",               { fg = c.neon_cyan,   bold = true })
hi("@function.builtin",       { fg = c.soft_cyan,   bold = true })
hi("@function.call",          { fg = c.neon_cyan })
hi("@function.macro",         { fg = c.neon_yellow })
hi("@function.method",        { fg = c.soft_cyan,   bold = true })
hi("@function.method.call",   { fg = c.soft_cyan })

-- Keywords
hi("@keyword",                { fg = c.neon_pink,   bold = true })
hi("@keyword.conditional",    { fg = c.neon_pink })
hi("@keyword.repeat",         { fg = c.neon_pink })
hi("@keyword.exception",      { fg = c.soft_red,    bold = true })
hi("@keyword.import",         { fg = c.soft_yellow })
hi("@keyword.operator",       { fg = c.neon_cyan })
hi("@keyword.return",         { fg = c.neon_pink,   italic = true })
hi("@keyword.function",       { fg = c.neon_pink,   bold = true })
hi("@keyword.modifier",       { fg = c.soft_purple })
hi("@keyword.type",           { fg = c.neon_blue,   bold = true })
hi("@keyword.coroutine",      { fg = c.soft_pink })
hi("@keyword.debug",          { fg = c.neon_red })

-- Types
hi("@type",                   { fg = c.neon_blue,   bold = true })
hi("@type.builtin",           { fg = c.soft_blue })
hi("@type.qualifier",         { fg = c.soft_blue,   italic = true })
hi("@type.definition",        { fg = c.neon_blue })

-- Operators / punctuation
hi("@operator",               { fg = c.neon_cyan })
hi("@punctuation.delimiter",  { fg = c.fg_dim })
hi("@punctuation.bracket",    { fg = c.soft_purple })
hi("@punctuation.special",    { fg = c.neon_cyan })

-- OOP
hi("@constructor",            { fg = c.neon_blue })
hi("@attribute",              { fg = c.neon_yellow })
hi("@attribute.builtin",      { fg = c.neon_yellow, bold = true })
hi("@property",               { fg = c.soft_cyan })
hi("@namespace",              { fg = c.soft_yellow })
hi("@module",                 { fg = c.soft_yellow })

-- Markup / docs
hi("@comment",                { fg = c.comment,     italic = true })
hi("@comment.documentation",  { fg = c.fg_dark,     italic = true })
hi("@comment.note",           { fg = c.neon_cyan,   bold = true })
hi("@comment.todo",           { fg = c.neon_yellow, bold = true })
hi("@comment.warning",        { fg = c.neon_orange, bold = true })
hi("@comment.error",          { fg = c.neon_red,    bold = true })
hi("@tag",                    { fg = c.neon_pink })
hi("@tag.attribute",          { fg = c.soft_yellow })
hi("@tag.delimiter",          { fg = c.fg_dark })
hi("@markup.heading",         { fg = c.neon_cyan,   bold = true })
hi("@markup.italic",          { fg = c.fg_dim,      italic = true })
hi("@markup.bold",            { fg = c.fg,          bold = true })
hi("@markup.underline",       { fg = c.fg,          underline = true })
hi("@markup.strikethrough",   { fg = c.fg_dark,     strikethrough = true })
hi("@markup.link",            { fg = c.neon_cyan,   underline = true })
hi("@markup.link.url",        { fg = c.soft_blue,   underline = true })
hi("@markup.raw",             { fg = c.soft_green })
hi("@markup.list",            { fg = c.neon_pink })
hi("@markup.list.checked",    { fg = c.neon_green })
hi("@markup.list.unchecked",  { fg = c.fg_dim })

-- ─── LSP Semantic Tokens ───────────────────────────────────────────────────
hi("@lsp.type.class",         { fg = c.neon_blue,   bold = true })
hi("@lsp.type.decorator",     { fg = c.neon_yellow })
hi("@lsp.type.enum",          { fg = c.neon_blue })
hi("@lsp.type.enumMember",    { fg = c.neon_orange })
hi("@lsp.type.function",      { fg = c.neon_cyan,   bold = true })
hi("@lsp.type.interface",     { fg = c.soft_blue,   italic = true })
hi("@lsp.type.keyword",       { fg = c.neon_pink,   bold = true })
hi("@lsp.type.macro",         { fg = c.neon_yellow })
hi("@lsp.type.method",        { fg = c.soft_cyan,   bold = true })
hi("@lsp.type.namespace",     { fg = c.soft_yellow })
hi("@lsp.type.number",        { fg = c.neon_orange })
hi("@lsp.type.operator",      { fg = c.neon_cyan })
hi("@lsp.type.parameter",     { fg = c.soft_yellow })
hi("@lsp.type.property",      { fg = c.soft_cyan })
hi("@lsp.type.string",        { fg = c.soft_green })
hi("@lsp.type.struct",        { fg = c.neon_blue })
hi("@lsp.type.type",          { fg = c.neon_blue })
hi("@lsp.type.typeParameter", { fg = c.soft_blue,   italic = true })
hi("@lsp.type.variable",      { fg = c.fg })
hi("@lsp.mod.deprecated",     { strikethrough = true })
hi("@lsp.mod.readonly",       { italic = true })
hi("@lsp.mod.static",         { bold = true })

-- ─── Diagnostics ───────────────────────────────────────────────────────────
hi("DiagnosticError",         { fg = c.neon_red })
hi("DiagnosticWarn",          { fg = c.neon_orange })
hi("DiagnosticInfo",          { fg = c.neon_cyan })
hi("DiagnosticHint",          { fg = c.neon_green })
hi("DiagnosticOk",            { fg = c.neon_green })
hi("DiagnosticUnderlineError",{ sp = c.neon_red,    undercurl = true })
hi("DiagnosticUnderlineWarn", { sp = c.neon_orange, undercurl = true })
hi("DiagnosticUnderlineInfo", { sp = c.neon_cyan,   undercurl = true })
hi("DiagnosticUnderlineHint", { sp = c.neon_green,  undercurl = true })
hi("DiagnosticVirtualTextError", { fg = c.neon_red,    bg = c.err_bg,  italic = true })
hi("DiagnosticVirtualTextWarn",  { fg = c.neon_orange, bg = c.warn_bg, italic = true })
hi("DiagnosticVirtualTextInfo",  { fg = c.neon_cyan,   bg = c.info_bg, italic = true })
hi("DiagnosticVirtualTextHint",  { fg = c.neon_green,  bg = c.hint_bg, italic = true })
hi("DiagnosticSignError",     { fg = c.neon_red })
hi("DiagnosticSignWarn",      { fg = c.neon_orange })
hi("DiagnosticSignInfo",      { fg = c.neon_cyan })
hi("DiagnosticSignHint",      { fg = c.neon_green })

-- ─── LSP References / Inlay ────────────────────────────────────────────────
hi("LspReferenceText",        { bg = c.bg_sel,     bold = true })
hi("LspReferenceRead",        { bg = c.bg_sel })
hi("LspReferenceWrite",       { bg = c.bg_sel,     underline = true })
hi("LspInlayHint",            { fg = c.fg_dark,    bg = c.bg_dim,  italic = true })
hi("LspSignatureActiveParameter", { fg = c.neon_yellow, bold = true })
hi("LspCodeLens",             { fg = c.comment,    italic = true })

-- ─── Telescope ─────────────────────────────────────────────────────────────
hi("TelescopeNormal",         { fg = c.fg,         bg = c.bg_mid })
hi("TelescopeBorder",         { fg = c.neon_purple, bg = c.bg_mid })
hi("TelescopeTitle",          { fg = c.neon_cyan,  bg = c.bg_mid,   bold = true })
hi("TelescopePromptNormal",   { fg = c.fg,         bg = c.bg_high })
hi("TelescopePromptBorder",   { fg = c.neon_cyan,  bg = c.bg_high })
hi("TelescopePromptTitle",    { fg = c.bg,         bg = c.neon_cyan, bold = true })
hi("TelescopeResultsTitle",   { fg = c.bg,         bg = c.neon_purple, bold = true })
hi("TelescopePreviewTitle",   { fg = c.bg,         bg = c.neon_pink,   bold = true })
hi("TelescopeSelection",      { fg = c.neon_cyan,  bg = c.bg_sel,   bold = true })
hi("TelescopeSelectionCaret", { fg = c.neon_pink })
hi("TelescopeMatching",       { fg = c.neon_yellow, bold = true })

-- ─── nvim-cmp ──────────────────────────────────────────────────────────────
hi("CmpItemAbbr",             { fg = c.fg_dim })
hi("CmpItemAbbrMatch",        { fg = c.neon_yellow, bold = true })
hi("CmpItemAbbrMatchFuzzy",   { fg = c.neon_orange, bold = true })
hi("CmpItemAbbrDeprecated",   { fg = c.fg_dark,    strikethrough = true })
hi("CmpItemMenu",             { fg = c.fg_dark,    italic = true })
hi("CmpItemKindDefault",      { fg = c.neon_purple })
hi("CmpItemKindFunction",     { fg = c.neon_cyan })
hi("CmpItemKindMethod",       { fg = c.soft_cyan })
hi("CmpItemKindKeyword",      { fg = c.neon_pink })
hi("CmpItemKindVariable",     { fg = c.fg })
hi("CmpItemKindField",        { fg = c.soft_cyan })
hi("CmpItemKindText",         { fg = c.fg_dim })
hi("CmpItemKindSnippet",      { fg = c.neon_yellow })
hi("CmpItemKindModule",       { fg = c.soft_yellow })
hi("CmpItemKindClass",        { fg = c.neon_blue })
hi("CmpItemKindInterface",    { fg = c.soft_blue })
hi("CmpItemKindStruct",       { fg = c.neon_blue })
hi("CmpItemKindEnum",         { fg = c.neon_blue })
hi("CmpItemKindEnumMember",   { fg = c.neon_orange })
hi("CmpItemKindConstructor",  { fg = c.neon_blue })
hi("CmpItemKindValue",        { fg = c.neon_orange })
hi("CmpItemKindUnit",         { fg = c.neon_orange })
hi("CmpItemKindProperty",     { fg = c.soft_cyan })
hi("CmpItemKindEvent",        { fg = c.neon_pink })
hi("CmpItemKindOperator",     { fg = c.neon_cyan })
hi("CmpItemKindTypeParameter",{ fg = c.soft_blue })
hi("CmpItemKindColor",        { fg = c.soft_pink })
hi("CmpItemKindFile",         { fg = c.fg_dim })
hi("CmpItemKindReference",    { fg = c.soft_purple })
hi("CmpItemKindFolder",       { fg = c.soft_yellow })

-- ─── Gitsigns / Git ────────────────────────────────────────────────────────
hi("GitSignsAdd",             { fg = c.neon_green })
hi("GitSignsChange",          { fg = c.neon_yellow })
hi("GitSignsDelete",          { fg = c.neon_red })
hi("GitSignsTopdelete",       { fg = c.neon_red })
hi("GitSignsChangedelete",    { fg = c.neon_orange })
hi("GitSignsUntracked",       { fg = c.fg_dark })

-- ─── DAP (debugger) ────────────────────────────────────────────────────────
hi("DapBreakpoint",           { fg = c.neon_red })
hi("DapBreakpointCondition",  { fg = c.neon_orange })
hi("DapLogPoint",             { fg = c.neon_cyan })
hi("DapStopped",              { fg = c.neon_green,  bg = "#001a00" })
hi("DapBreakpointRejected",   { fg = c.fg_dark })

-- ─── Harpoon ───────────────────────────────────────────────────────────────
hi("HarpoonBorder",           { fg = c.neon_pink,  bg = c.bg_mid })
hi("HarpoonWindow",           { fg = c.fg,         bg = c.bg_mid })

-- ─── Which-key ─────────────────────────────────────────────────────────────
hi("WhichKey",                { fg = c.neon_cyan })
hi("WhichKeyGroup",           { fg = c.neon_pink,  bold = true })
hi("WhichKeyDesc",            { fg = c.fg_dim })
hi("WhichKeySeparator",       { fg = c.comment })
hi("WhichKeyFloat",           { bg = c.bg_mid })

-- ─── Indent / Scope ────────────────────────────────────────────────────────
hi("IndentBlanklineChar",         { fg = c.bg_high })
hi("IndentBlanklineContextChar",  { fg = c.neon_purple })
hi("IblIndent",               { fg = c.bg_high })
hi("IblScope",                { fg = c.neon_purple })

-- ─── Misc ──────────────────────────────────────────────────────────────────
hi("Directory",               { fg = c.neon_cyan,  bold = true })
hi("Title",                   { fg = c.neon_cyan,  bold = true })
hi("NonText",                 { fg = c.bg_high })
hi("SpecialKey",              { fg = c.fg_dark })
hi("Whitespace",              { fg = c.bg_high })
hi("WildMenu",                { fg = c.bg,         bg = c.neon_cyan })
hi("QuickFixLine",            { fg = c.neon_yellow, bold = true })
hi("qfLineNr",                { fg = c.neon_pink })
hi("qfFileName",              { fg = c.neon_cyan })
hi("debugPC",                 { bg = c.info_bg })
hi("debugBreakpoint",         { fg = c.neon_red })
