-- fl4my_sublime.lua
-- Sublime Text inspired colorscheme for Neovim (Treesitter + LSP)
-- Drop in: ~/.config/nvim/colors/fl4my_sublime.lua
-- Usage:   :colorscheme fl4my_sublime

vim.cmd("hi clear")
if vim.fn.exists("syntax_on") then vim.cmd("syntax reset") end
vim.g.colors_name = "fl4my_sublime"
vim.o.termguicolors = true
vim.o.background = "dark"

local c = {
  -- Editor chrome
  -- bg          = "#0d1117",   -- flamy_cold terminal background
  bg          = "#000000",   -- flamy_cold terminal background
  bg_alt      = "#161b22",   -- cursorline / sidebars
  bg_panel    = "#1c2128",   -- panels / floats
  bg_sel      = "#2a3f54",   -- visual selection
  bg_search   = "#3a4a2a",   -- search match bg
  border      = "#30363d",   -- popup borders
  line_nr     = "#3d444d",   -- line numbers
  comment     = "#5c6370",   -- comments
  fg          = "#9ea8b1",   -- flamy_cold foreground
  fg_dim      = "#636e7b",   -- dimmed
  fg_bright   = "#cdd9e5",   -- bright cold white
  fg_inv      = "#0d1117",   -- inverted

  -- Syntax
  keyword     = "#C695C6",   -- purple: def/class/if/for/while/return/from/import
  operator    = "#F97B58",   -- orange-red: = == != in or and
  string      = "#99C794",   -- green strings
  string_esc  = "#5FB4B4",   -- teal: escape seqs / fstring {} / quotes
  number      = "#F9AE58",   -- warm yellow: numbers
  boolean     = "#EC5F66",   -- red: True / False / None
  func_builtin= "#6699CC",   -- blue: print / len / range / max
  func_def    = "#5FB4B4",   -- teal: user-defined function names (count_ips)
  method      = "#6699CC",   -- blue: .method() calls
  type        = "#cdd3de",   -- fg: regular types
  type_builtin= "#F9AE58",   -- warm yellow: int / str / dict annotations
  param       = "#F9AE58",   -- warm yellow: parameters (logs)
  self        = "#C695C6",   -- purple: self
  field       = "#cdd3de",   -- fg: fields/properties
  constant    = "#F9AE58",   -- warm yellow: constants
  punct       = "#cdd3de",   -- fg: punctuation () [] {}
  namespace   = "#cdd3de",   -- fg: module names
  decorator   = "#C695C6",   -- purple: decorators
  label       = "#F97B58",   -- orange-red: labels
  tag         = "#EC5F66",   -- red: HTML tags
  attr        = "#F9AE58",   -- yellow: HTML attrs
  preproc     = "#C695C6",   -- purple: import/from

  -- UI
  red         = "#EC5F66",
  yellow      = "#F9AE58",
  green       = "#99C794",
  blue        = "#6699CC",
  teal        = "#5FB4B4",
  magenta     = "#C695C6",
}

local function hi(group, opts)
  if opts.fg and opts.bold == nil then
    opts.bold = true
  end
  vim.api.nvim_set_hl(0, group, opts)
end

-- ─── Editor Chrome ────────────────────────────────────────────────────────────
hi("Normal",          { fg = c.fg,       bg = c.bg })
hi("NormalFloat",     { fg = c.fg,       bg = c.bg_panel })
hi("NormalNC",        { fg = c.fg,       bg = c.bg })
hi("SignColumn",      { fg = c.line_nr,  bg = c.bg })
hi("LineNr",          { fg = c.line_nr,  bg = c.bg })
hi("CursorLineNr",    { fg = c.fg_bright, bg = c.bg, bold = true })
hi("CursorLine",      { bg = c.bg_alt })
hi("CursorColumn",    { bg = c.bg_alt })
hi("ColorColumn",     { bg = c.bg_alt })
hi("VertSplit",       { fg = c.border,   bg = c.bg })
hi("WinSeparator",    { fg = c.border,   bg = c.bg })
hi("FloatBorder",     { fg = c.border,   bg = c.bg_panel })
hi("StatusLine",      { fg = c.fg,       bg = c.bg_panel })
hi("StatusLineNC",    { fg = c.fg_dim,   bg = c.bg_alt })
hi("TabLine",         { fg = c.fg_dim,   bg = c.bg_alt })
hi("TabLineFill",     { bg = c.bg_alt })
hi("TabLineSel",      { fg = c.fg_bright, bg = c.bg, bold = true })
hi("Pmenu",           { fg = c.fg,       bg = c.bg_panel })
hi("PmenuSel",        { fg = c.fg_bright, bg = c.bg_sel })
hi("PmenuSbar",       { bg = c.bg_panel })
hi("PmenuThumb",      { bg = c.border })
hi("Folded",          { fg = c.comment,  bg = c.bg_alt, italic = true })
hi("FoldColumn",      { fg = c.line_nr,  bg = c.bg })
hi("EndOfBuffer",     { fg = c.border })
hi("NonText",         { fg = c.border })
hi("Whitespace",      { fg = c.border })
hi("SpecialKey",      { fg = c.border })
hi("MatchParen",      { fg = c.fg,       bg = "#3a3a3a", bold = true })
hi("Visual",          { bg = c.bg_sel })
hi("VisualNOS",       { bg = c.bg_sel })
hi("Search",          { fg = c.fg,       bg = c.bg_search })
hi("IncSearch",       { fg = c.fg_inv,   bg = c.teal,    bold = true })
hi("CurSearch",       { fg = c.fg_inv,   bg = c.blue,    bold = true })
hi("Substitute",      { fg = c.fg_inv,   bg = c.yellow })
hi("WildMenu",        { fg = c.fg_inv,   bg = c.blue })
hi("QuickFixLine",    { bg = c.bg_sel })
hi("Directory",       { fg = c.teal })
hi("Title",           { fg = c.fg_bright, bold = true })
hi("Question",        { fg = c.green })
hi("MoreMsg",         { fg = c.green })
hi("ModeMsg",         { fg = c.fg_bright, bold = true })
hi("MsgArea",         { fg = c.fg })
hi("MsgSeparator",    { fg = c.border })

-- ─── Diagnostics ──────────────────────────────────────────────────────────────
hi("Error",           { fg = c.red })
hi("ErrorMsg",        { fg = c.red })
hi("WarningMsg",      { fg = c.yellow })
hi("DiagnosticError", { fg = c.red })
hi("DiagnosticWarn",  { fg = c.yellow })
hi("DiagnosticInfo",  { fg = c.blue })
hi("DiagnosticHint",  { fg = c.teal })
hi("DiagnosticOk",    { fg = c.green })
hi("DiagnosticUnderlineError", { undercurl = true, sp = c.red })
hi("DiagnosticUnderlineWarn",  { undercurl = true, sp = c.yellow })
hi("DiagnosticUnderlineInfo",  { undercurl = true, sp = c.blue })
hi("DiagnosticUnderlineHint",  { undercurl = true, sp = c.teal })
hi("DiagnosticVirtualTextError", { fg = c.red,     italic = true })
hi("DiagnosticVirtualTextWarn",  { fg = c.yellow,  italic = true })
hi("DiagnosticVirtualTextInfo",  { fg = c.blue,    italic = true })
hi("DiagnosticVirtualTextHint",  { fg = c.teal,    italic = true })

-- ─── Legacy Syntax Groups ─────────────────────────────────────────────────────
hi("Comment",         { fg = c.comment,  italic = true })
hi("Constant",        { fg = c.constant })
hi("String",          { fg = c.string })
hi("Character",       { fg = c.string })
hi("Number",          { fg = c.number })
hi("Boolean",         { fg = c.boolean })
hi("Float",           { fg = c.number })
hi("Identifier",      { fg = c.fg })
hi("Function",        { fg = c.func_def })
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
hi("SpecialComment",  { fg = c.comment,  italic = true, bold = true })
hi("Debug",           { fg = c.red })
hi("Underlined",      { underline = true })
hi("Ignore",          { fg = c.comment })
hi("Todo",            { fg = c.fg_inv,   bg = c.yellow, bold = true })
hi("SpellBad",        { undercurl = true, sp = c.red })
hi("SpellCap",        { undercurl = true, sp = c.yellow })
hi("SpellRare",       { undercurl = true, sp = c.teal })
hi("SpellLocal",      { undercurl = true, sp = c.blue })

-- ─── Treesitter ───────────────────────────────────────────────────────────────
-- Variables
hi("@variable",               { fg = c.fg })
hi("@variable.builtin",       { fg = c.self })            -- self
hi("@variable.parameter",     { fg = c.param })           -- logs, name
hi("@variable.parameter.builtin", { fg = c.self })        -- self as param
hi("@variable.member",        { fg = c.field })

-- Constants
hi("@constant",               { fg = c.constant })
hi("@constant.builtin",       { fg = c.boolean })         -- None/True/False
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
hi("@boolean",                { fg = c.boolean })         -- True / False

-- Functions
hi("@function",               { fg = c.func_def })        -- def count_ips
hi("@function.builtin",       { fg = c.func_builtin })    -- print / len / max
hi("@function.call",          { fg = c.func_def })        -- count_ips()
hi("@function.macro",         { fg = c.preproc })
hi("@function.method",        { fg = c.method })          -- .format() .get()
hi("@function.method.call",   { fg = c.method })

-- Types
hi("@type",                   { fg = c.type })
hi("@type.builtin",           { fg = c.type_builtin })    -- int str dict
hi("@type.definition",        { fg = c.func_def })
hi("@type.qualifier",         { fg = c.keyword })

-- Keywords
hi("@keyword",                { fg = c.keyword })         -- purple
hi("@keyword.function",       { fg = c.keyword })         -- def
hi("@keyword.operator",       { fg = c.keyword })        -- in or and
hi("@keyword.return",         { fg = c.keyword })         -- return
hi("@keyword.import",         { fg = c.preproc })         -- import from
hi("@keyword.coroutine",      { fg = c.keyword })
hi("@keyword.exception",      { fg = c.keyword })
hi("@keyword.conditional",    { fg = c.keyword })         -- if else elif
hi("@keyword.repeat",         { fg = c.keyword })         -- for while
hi("@keyword.debug",          { fg = c.red })
hi("@keyword.storage",        { fg = c.keyword })
hi("@keyword.modifier",       { fg = c.keyword })

-- Operators / punctuation
hi("@operator",               { fg = c.operator })        -- = == != in or
hi("@punctuation.delimiter",  { fg = c.punct })           -- , . ;
hi("@punctuation.bracket",    { fg = c.punct })           -- () [] {}
hi("@punctuation.special",    { fg = c.string_esc })      -- fstring { }

-- Labels / attributes
hi("@label",                  { fg = c.label })
hi("@attribute",              { fg = c.decorator })
hi("@attribute.builtin",      { fg = c.decorator })

-- Namespaces / modules
hi("@module",                 { fg = c.namespace })
hi("@module.builtin",         { fg = c.namespace })
hi("@namespace",              { fg = c.namespace })

-- Comments
hi("@comment",                { fg = c.comment, italic = true })
hi("@comment.documentation",  { fg = c.comment, italic = true })
hi("@comment.note",           { fg = c.teal,    bold = true })
hi("@comment.todo",           { fg = c.yellow,  bold = true })
hi("@comment.warning",        { fg = c.yellow,  bold = true })
hi("@comment.error",          { fg = c.red,     bold = true })

-- Markup
hi("@markup.heading",         { fg = c.magenta, bold = true })
hi("@markup.bold",            { bold = true })
hi("@markup.italic",          { italic = true })
hi("@markup.underline",       { underline = true })
hi("@markup.strikethrough",   { strikethrough = true })
hi("@markup.link",            { fg = c.blue,    underline = true })
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
hi("@diff.delta",             { fg = c.blue })

-- ─── LSP Semantic Tokens ──────────────────────────────────────────────────────
hi("@lsp.type.class",         { fg = c.type })
hi("@lsp.type.enum",          { fg = c.type })
hi("@lsp.type.enumMember",    { fg = c.constant })
hi("@lsp.type.function",      { fg = c.func_def })
hi("@lsp.type.interface",     { fg = c.type })
hi("@lsp.type.keyword",       { fg = c.keyword })
hi("@lsp.type.macro",         { fg = c.preproc })
hi("@lsp.type.method",        { fg = c.method })
hi("@lsp.type.namespace",     { fg = c.namespace })
hi("@lsp.type.number",        { fg = c.number })
hi("@lsp.type.operator",      { fg = c.operator })
hi("@lsp.type.parameter",     { fg = c.param })
hi("@lsp.type.property",      { fg = c.field })
hi("@lsp.type.string",        { fg = c.string })
hi("@lsp.type.struct",        { fg = c.type })
hi("@lsp.type.type",          { fg = c.type_builtin })
hi("@lsp.type.typeParameter", { fg = c.type })
hi("@lsp.type.variable",      { fg = c.fg })
hi("@lsp.type.decorator",     { fg = c.decorator })
hi("@lsp.mod.deprecated",     { strikethrough = true })
hi("@lsp.mod.readonly",       { fg = c.constant })
hi("@lsp.mod.static",         { fg = c.constant, italic = true })
hi("@lsp.type.selfParameter", { fg = c.self })
hi("@lsp.type.builtinConstant", { fg = c.boolean })

-- ─── Diff / VCS ───────────────────────────────────────────────────────────────
hi("DiffAdd",     { fg = c.green,     bg = "#1a2e1a" })
hi("DiffChange",  { fg = c.blue,      bg = "#1a1a2e" })
hi("DiffDelete",  { fg = c.red,       bg = "#2e1a1a" })
hi("DiffText",    { fg = c.fg_bright, bg = "#1a2a3a", bold = true })
hi("Added",       { fg = c.green })
hi("Changed",     { fg = c.blue })
hi("Removed",     { fg = c.red })

-- ─── GitSigns ─────────────────────────────────────────────────────────────────
hi("GitSignsAdd",    { fg = c.green })
hi("GitSignsChange", { fg = c.blue })
hi("GitSignsDelete", { fg = c.red })

-- ─── nvim-tree ────────────────────────────────────────────────────────────────
hi("NvimTreeNormal",           { fg = c.fg,       bg = c.bg_panel })
hi("NvimTreeRootFolder",       { fg = c.fg_bright, bold = true })
hi("NvimTreeFolderIcon",       { fg = c.teal })
hi("NvimTreeFolderName",       { fg = c.fg })
hi("NvimTreeOpenedFolderName", { fg = c.fg_bright })
hi("NvimTreeGitDirty",         { fg = c.yellow })
hi("NvimTreeGitStaged",        { fg = c.green })
hi("NvimTreeGitDeleted",       { fg = c.red })

-- ─── Telescope ────────────────────────────────────────────────────────────────
hi("TelescopeNormal",         { fg = c.fg,      bg = c.bg_panel })
hi("TelescopeBorder",         { fg = c.border,  bg = c.bg_panel })
hi("TelescopePromptNormal",   { fg = c.fg,      bg = c.bg_alt })
hi("TelescopePromptBorder",   { fg = c.border,  bg = c.bg_alt })
hi("TelescopePromptTitle",    { fg = c.fg_inv,  bg = c.magenta, bold = true })
hi("TelescopePreviewTitle",   { fg = c.fg_inv,  bg = c.teal,    bold = true })
hi("TelescopeResultsTitle",   { fg = c.fg_inv,  bg = c.blue,    bold = true })
hi("TelescopeSelection",      { bg = c.bg_sel })
hi("TelescopeMatching",       { fg = c.yellow,  bold = true })

-- ─── which-key ────────────────────────────────────────────────────────────────
hi("WhichKey",          { fg = c.teal })
hi("WhichKeyGroup",     { fg = c.magenta })
hi("WhichKeyDesc",      { fg = c.fg })
hi("WhichKeySeparator", { fg = c.comment })

-- ─── indent-blankline ─────────────────────────────────────────────────────────
hi("IblIndent", { fg = c.border })
hi("IblScope",  { fg = c.comment })

-- ─── Mason / Lazy ─────────────────────────────────────────────────────────────
hi("MasonNormal", { fg = c.fg, bg = c.bg_panel })
