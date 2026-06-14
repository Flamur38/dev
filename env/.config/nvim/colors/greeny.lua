-- fl4my_greeny.lua
-- Green terminal colorscheme for Neovim (Treesitter + LSP)
-- Drop in: ~/.config/nvim/colors/fl4my_greeny.lua
-- Usage:   :colorscheme fl4my_greeny

vim.cmd("hi clear")
if vim.fn.exists("syntax_on") then vim.cmd("syntax reset") end
vim.g.colors_name = "fl4my_greeny"
vim.o.termguicolors = true
vim.o.background = "dark"

local c = {
  -- Editor chrome
  bg          = "#000000",   -- pure black background
  bg_alt      = "#0d0d0d",   -- cursorline / sidebars
  bg_panel    = "#111111",   -- panels / floats
  bg_sel      = "#003300",   -- visual selection
  bg_search   = "#1a3a1a",   -- search match bg
  border      = "#1a3a1a",   -- popup borders
  line_nr     = "#2a5a2a",   -- line numbers
  comment     = "#2e7a2e",   -- comments (dim green)
  fg          = "#4FFD58",   -- default foreground (bright green)
  fg_dim      = "#2db830",   -- dimmed text
  fg_inv      = "#000000",   -- inverted

  -- Syntax
  keyword     = "#da8bdf",   -- magenta: keywords
  string      = "#D8A06A",   -- warm orange: strings
  string_esc  = "#D8A06A",   -- escape sequences
  number      = "#D8A06A",   -- numbers
  func        = "#4FFD58",   -- functions (fg green, bold)
  method      = "#4FFD58",   -- methods
  type        = "#4FFD58",   -- types / class names
  type_builtin= "#da8bdf",   -- built-in types (int, str…)
  param       = "#4FFD58",   -- parameters
  field       = "#4FFD58",   -- struct fields
  constant    = "#D8A06A",   -- constants
  operator    = "#4FFD58",   -- operators
  punct       = "#4FFD58",   -- punctuation
  namespace   = "#4FFD58",   -- module names
  decorator   = "#da8bdf",   -- decorators
  label       = "#da8bdf",   -- labels
  tag         = "#4FFD58",   -- HTML/XML tags
  attr        = "#4FFD58",   -- HTML attributes
  preproc     = "#3E7580",   -- preprocessor / import

  -- UI
  red         = "#ff4444",   -- errors
  yellow      = "#D8A06A",   -- warnings
  green       = "#4FFD58",   -- ok
  blue        = "#4FFD58",   -- info
  teal        = "#3E7580",   -- accent
  magenta     = "#da8bdf",   -- special
}

local function hi(group, opts)
  -- inject bold=true into every fg highlight unless explicitly overridden
  if opts.fg and opts.bold == nil then
    opts.bold = true
  end
  vim.api.nvim_set_hl(0, group, opts)
end

-- ─── Editor Chrome ────────────────────────────────────────────────────────────
hi("Normal",          { fg = c.fg,      bg = c.bg })
hi("NormalFloat",     { fg = c.fg,      bg = c.bg_panel })
hi("NormalNC",        { fg = c.fg,      bg = c.bg })
hi("SignColumn",      { fg = c.line_nr, bg = c.bg })
hi("LineNr",          { fg = c.line_nr, bg = c.bg })
hi("CursorLineNr",    { fg = c.fg,      bg = c.bg })
hi("CursorLine",      { bg = c.bg_alt, bold = false })
hi("CursorColumn",    { bg = c.bg_alt, bold = false })
hi("ColorColumn",     { bg = c.bg_alt, bold = false })
hi("VertSplit",       { fg = c.border,  bg = c.bg })
hi("WinSeparator",    { fg = c.border,  bg = c.bg })
hi("FloatBorder",     { fg = c.border,  bg = c.bg_panel })
hi("StatusLine",      { fg = c.string,      bg = c.bg })
hi("StatusLineNC",    { fg = c.fg_dim,  bg = c.bg_alt })
hi("TabLine",         { fg = c.fg_dim,  bg = c.bg_alt })
hi("TabLineFill",     { bg = c.bg_alt, bold = false })
hi("TabLineSel",      { fg = c.fg,      bg = c.bg })
hi("Pmenu",           { fg = c.fg,      bg = c.bg_panel })
hi("PmenuSel",        { fg = c.fg,      bg = c.bg_sel })
hi("PmenuSbar",       { bg = c.bg_panel, bold = false })
hi("PmenuThumb",      { bg = c.border, bold = false })
hi("Folded",          { fg = c.comment, bg = c.bg_alt, italic = true })
hi("FoldColumn",      { fg = c.line_nr, bg = c.bg })
hi("EndOfBuffer",     { fg = c.border })
hi("NonText",         { fg = c.border })
hi("Whitespace",      { fg = c.border })
hi("SpecialKey",      { fg = c.border })
hi("MatchParen",      { fg = c.red,     bold = true })
hi("Visual",          { bg = c.bg_sel, bold = false })
hi("VisualNOS",       { bg = c.bg_sel, bold = false })
hi("Search",          { fg = c.fg,      bg = c.bg_search })
hi("IncSearch",       { fg = c.bg,      bg = c.fg })
hi("CurSearch",       { fg = c.bg,      bg = c.fg })
hi("Substitute",      { fg = c.bg,      bg = c.yellow })
hi("WildMenu",        { fg = c.bg,      bg = c.fg })
hi("QuickFixLine",    { bg = c.bg_sel, bold = false })
hi("Directory",       { fg = c.teal })
hi("Title",           { fg = c.fg })
hi("Question",        { fg = c.fg })
hi("MoreMsg",         { fg = c.fg })
hi("ModeMsg",         { fg = c.fg })
hi("MsgArea",         { fg = c.fg })
hi("MsgSeparator",    { fg = c.border })

-- ─── Diagnostics ──────────────────────────────────────────────────────────────
hi("Error",           { fg = c.red })
hi("ErrorMsg",        { fg = c.red })
hi("WarningMsg",      { fg = c.yellow })
hi("DiagnosticError", { fg = c.red })
hi("DiagnosticWarn",  { fg = c.yellow })
hi("DiagnosticInfo",  { fg = c.fg })
hi("DiagnosticHint",  { fg = c.teal })
hi("DiagnosticOk",    { fg = c.green })
hi("DiagnosticUnderlineError", { undercurl = true, sp = c.red,    bold = false })
hi("DiagnosticUnderlineWarn",  { undercurl = true, sp = c.yellow, bold = false })
hi("DiagnosticUnderlineInfo",  { undercurl = true, sp = c.fg,     bold = false })
hi("DiagnosticUnderlineHint",  { undercurl = true, sp = c.teal,   bold = false })
hi("DiagnosticVirtualTextError", { fg = c.red,    italic = true })
hi("DiagnosticVirtualTextWarn",  { fg = c.yellow, italic = true })
hi("DiagnosticVirtualTextInfo",  { fg = c.fg,     italic = true })
hi("DiagnosticVirtualTextHint",  { fg = c.teal,   italic = true })

-- ─── Legacy Syntax Groups ─────────────────────────────────────────────────────
hi("Comment",         { fg = c.comment, italic = true })
hi("Constant",        { fg = c.constant })
hi("String",          { fg = c.string })
hi("Character",       { fg = c.string })
hi("Number",          { fg = c.number })
hi("Boolean",         { fg = c.number })
hi("Float",           { fg = c.number })
hi("Identifier",      { fg = c.fg })
hi("Function",        { fg = c.func })
hi("Statement",       { fg = c.keyword })
hi("Conditional",     { fg = c.keyword })
hi("Repeat",          { fg = c.keyword })
hi("Label",           { fg = c.label })
hi("Operator",        { fg = c.operator })
hi("Keyword",         { fg = c.keyword })
hi("Exception",       { fg = c.keyword })
hi("PreProc",         { fg = c.preproc })
hi("Include",         { fg = c.preproc })
hi("Define",          { fg = c.preproc })
hi("Macro",           { fg = c.preproc })
hi("PreCondit",       { fg = c.preproc })
hi("Type",            { fg = c.type })
hi("StorageClass",    { fg = c.keyword })
hi("Structure",       { fg = c.type })
hi("Typedef",         { fg = c.type })
hi("Special",         { fg = c.string_esc })
hi("SpecialChar",     { fg = c.string_esc })
hi("Tag",             { fg = c.tag })
hi("Delimiter",       { fg = c.punct })
hi("SpecialComment",  { fg = c.comment, italic = true })
hi("Debug",           { fg = c.red })
hi("Underlined",      { underline = true, bold = false })
hi("Ignore",          { fg = c.comment })
hi("Todo",            { fg = c.bg,      bg = c.magenta })
hi("SpellBad",        { undercurl = true, sp = c.red,    bold = false })
hi("SpellCap",        { undercurl = true, sp = c.yellow, bold = false })
hi("SpellRare",       { undercurl = true, sp = c.teal,   bold = false })
hi("SpellLocal",      { undercurl = true, sp = c.fg,     bold = false })

-- ─── Treesitter ───────────────────────────────────────────────────────────────
-- Variables
hi("@variable",               { fg = c.fg })
hi("@variable.builtin",       { fg = c.keyword })
hi("@variable.parameter",     { fg = c.param })
hi("@variable.member",        { fg = c.field })

-- Constants
hi("@constant",               { fg = c.constant })
hi("@constant.builtin",       { fg = c.number })
hi("@constant.macro",         { fg = c.preproc })

-- Strings
hi("@string",                 { fg = c.string })
hi("@string.escape",          { fg = c.string_esc })
hi("@string.special",         { fg = c.string_esc })
hi("@string.regexp",          { fg = c.string_esc })

-- Characters / numbers
hi("@character",              { fg = c.string })
hi("@number",                 { fg = c.number })
hi("@number.float",           { fg = c.number })
hi("@boolean",                { fg = c.number })

-- Functions
hi("@function",               { fg = c.func })
hi("@function.builtin",       { fg = c.func })
hi("@function.call",          { fg = c.func })
hi("@function.macro",         { fg = c.preproc })
hi("@function.method",        { fg = c.method })
hi("@function.method.call",   { fg = c.method })

-- Types
hi("@type",                   { fg = c.type })
hi("@type.builtin",           { fg = c.fg })
hi("@type.definition",        { fg = c.type })
hi("@type.qualifier",         { fg = c.keyword })

-- Keywords
hi("@keyword",                { fg = c.keyword })
hi("@keyword.function",       { fg = c.keyword })
hi("@keyword.operator",       { fg = c.magenta })  -- in / and / or / not
hi("@keyword.return",         { fg = c.keyword })
hi("@keyword.import",         { fg = c.preproc })
hi("@keyword.coroutine",      { fg = c.keyword })
hi("@keyword.exception",      { fg = c.keyword })
hi("@keyword.conditional",    { fg = c.keyword })
hi("@keyword.repeat",         { fg = c.keyword })
hi("@keyword.debug",          { fg = c.red })
hi("@keyword.storage",        { fg = c.keyword })
hi("@keyword.modifier",       { fg = c.keyword })

-- Operators / punctuation
hi("@operator",               { fg = c.operator })
hi("@punctuation.delimiter",  { fg = c.fg })
hi("@punctuation.bracket",    { fg = c.fg })
hi("@punctuation.special",    { fg = c.fg })        -- fstring { }

-- Labels / attributes
hi("@label",                  { fg = c.label })
hi("@attribute",              { fg = c.decorator })
hi("@attribute.builtin",      { fg = c.decorator })

-- Namespaces / modules
hi("@module",                 { fg = c.namespace })
hi("@module.builtin",         { fg = c.namespace })
hi("@namespace",              { fg = c.namespace })

-- Comments
hi("@comment",                { fg = c.comment, italic = true, bold = false })
hi("@comment.documentation",  { fg = c.comment, italic = true, bold = false })
hi("@comment.note",           { fg = c.teal })
hi("@comment.todo",           { fg = c.magenta })
hi("@comment.warning",        { fg = c.yellow })
hi("@comment.error",          { fg = c.red })

-- Markup
hi("@markup.heading",         { fg = c.fg })
hi("@markup.bold",            { bold = true })
hi("@markup.italic",          { italic = true, bold = false })
hi("@markup.underline",       { underline = true, bold = false })
hi("@markup.strikethrough",   { strikethrough = true, bold = false })
hi("@markup.link",            { fg = c.teal,    underline = true })
hi("@markup.link.url",        { fg = c.teal,    underline = true })
hi("@markup.raw",             { fg = c.string })
hi("@markup.list",            { fg = c.keyword })
hi("@tag",                    { fg = c.tag })
hi("@tag.builtin",            { fg = c.tag })
hi("@tag.attribute",          { fg = c.attr })
hi("@tag.delimiter",          { fg = c.punct })

-- Diff
hi("@diff.plus",              { fg = c.green })
hi("@diff.minus",             { fg = c.red })
hi("@diff.delta",             { fg = c.fg })

-- ─── LSP Semantic Tokens ──────────────────────────────────────────────────────
hi("@lsp.type.class",         { fg = c.fg })
hi("@lsp.type.enum",          { fg = c.fg })
hi("@lsp.type.enumMember",    { fg = c.constant })
hi("@lsp.type.function",      { fg = c.func })
hi("@lsp.type.interface",     { fg = c.fg })
hi("@lsp.type.keyword",       { fg = c.keyword })
hi("@lsp.type.macro",         { fg = c.preproc })
hi("@lsp.type.method",        { fg = c.method })
hi("@lsp.type.namespace",     { fg = c.namespace })
hi("@lsp.type.number",        { fg = c.number })
hi("@lsp.type.operator",      { fg = c.operator })
hi("@lsp.type.parameter",     { fg = c.param })
hi("@lsp.type.property",      { fg = c.field })
hi("@lsp.type.string",        { fg = c.string })
hi("@lsp.type.struct",        { fg = c.fg })
hi("@lsp.type.type",          { fg = c.magenta })
hi("@lsp.type.typeParameter", { fg = c.fg })
hi("@lsp.type.variable",      { fg = c.fg })
hi("@lsp.type.decorator",     { fg = c.decorator })
hi("@lsp.mod.deprecated",     { strikethrough = true, bold = false })
hi("@lsp.mod.readonly",       { fg = c.constant })
hi("@lsp.mod.static",         { fg = c.constant })

-- ─── Diff / VCS ───────────────────────────────────────────────────────────────
hi("DiffAdd",     { fg = c.green,   bg = "#001a00" })
hi("DiffChange",  { fg = c.teal,    bg = "#001a1a" })
hi("DiffDelete",  { fg = c.red,     bg = "#1a0000" })
hi("DiffText",    { fg = c.fg,      bg = "#003333" })
hi("Added",       { fg = c.green })
hi("Changed",     { fg = c.teal })
hi("Removed",     { fg = c.red })

-- ─── GitSigns ─────────────────────────────────────────────────────────────────
hi("GitSignsAdd",    { fg = c.green })
hi("GitSignsChange", { fg = c.teal })
hi("GitSignsDelete", { fg = c.red })

-- ─── nvim-tree ────────────────────────────────────────────────────────────────
hi("NvimTreeNormal",           { fg = c.fg,      bg = c.bg_panel })
hi("NvimTreeRootFolder",       { fg = c.fg })
hi("NvimTreeFolderIcon",       { fg = c.teal })
hi("NvimTreeFolderName",       { fg = c.fg })
hi("NvimTreeOpenedFolderName", { fg = c.fg })
hi("NvimTreeGitDirty",         { fg = c.yellow })
hi("NvimTreeGitStaged",        { fg = c.green })
hi("NvimTreeGitDeleted",       { fg = c.red })

-- ─── Telescope ────────────────────────────────────────────────────────────────
hi("TelescopeNormal",         { fg = c.fg,      bg = c.bg_panel })
hi("TelescopeBorder",         { fg = c.border,  bg = c.bg_panel })
hi("TelescopePromptNormal",   { fg = c.fg,      bg = c.bg_alt })
hi("TelescopePromptBorder",   { fg = c.border,  bg = c.bg_alt })
hi("TelescopePromptTitle",    { fg = c.bg,      bg = c.magenta })
hi("TelescopePreviewTitle",   { fg = c.bg,      bg = c.teal })
hi("TelescopeResultsTitle",   { fg = c.bg,      bg = c.fg })
hi("TelescopeSelection",      { bg = c.bg_sel, bold = false })
hi("TelescopeMatching",       { fg = c.magenta })

-- ─── which-key ────────────────────────────────────────────────────────────────
hi("WhichKey",          { fg = c.magenta })
hi("WhichKeyGroup",     { fg = c.teal })
hi("WhichKeyDesc",      { fg = c.fg })
hi("WhichKeySeparator", { fg = c.comment })

-- ─── indent-blankline ─────────────────────────────────────────────────────────
hi("IblIndent", { fg = c.border, bold = false })
hi("IblScope",  { fg = c.comment, bold = false })

-- ─── Mason / Lazy ─────────────────────────────────────────────────────────────
hi("MasonNormal", { fg = c.fg, bg = c.bg_panel })

-- ─── Python-specific overrides ────────────────────────────────────────────────
-- f prefix on fstrings
hi("@string.special.url",     { fg = c.magenta })
vim.api.nvim_set_hl(0, "@keyword.fstring",   { fg = c.magenta, bold = true })
vim.api.nvim_set_hl(0, "@string.fstring",    { fg = c.string,  bold = true })
-- string prefix (f/b/r) — caught by @character.special in some parsers
vim.api.nvim_set_hl(0, "@character.special", { fg = c.magenta, bold = true })
