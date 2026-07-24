-- fl4my_soc.lua
-- shares its palette with the SOC terminator profile.
-- severity mapping is preserved from the terminal:
--   red = error only, amber = warning, green = ok/literals,
--   cyan = metadata and types, blue = structure, purple = anomaly/values

vim.cmd("hi clear")
if vim.fn.exists("syntax_on") == 1 then
  vim.cmd("syntax reset")
end

vim.o.background = "dark"
vim.o.termguicolors = true
vim.g.colors_name = "fl4my_soc"

local c = {
  -- surfaces
  bg        = "#0F1319",                                   -- terminal background
  bg_line   = "#141922",                                   -- cursorline
  bg_alt    = "#1A1F27",                                   -- floats, ansi black
  bg_sel    = "#242B36",                                   -- visual, selection
  border    = "#2B3340",

  -- text
  fg        = "#D6DEE8",
  fg_dim    = "#8A94A6",
  comment   = "#5F6B7D",
  linenr    = "#3A4352",

  -- severity accents
  red       = "#FF4D5E",                                   -- critical / error
  green     = "#3DD68C",                                   -- clear / strings
  amber     = "#FFB020",                                   -- warning / keywords
  blue      = "#3B9EFF",                                   -- info / structure
  purple    = "#C77DFF",                                   -- anomaly / values
  cyan      = "#22D3EE",                                   -- metadata / types

  -- bright row
  red_br    = "#FF7A85",
  green_br  = "#6EE7B7",
  amber_br  = "#FFD166",
  blue_br   = "#7CC0FF",
  purple_br = "#DDA8FF",
  cyan_br   = "#67E8F9",
  white_br  = "#F3F6FA",
}

local hi = function(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

local groups = {
  -- chrome
  Normal         = { fg = c.fg, bg = c.bg },
  NormalFloat    = { fg = c.fg, bg = c.bg_alt },
  FloatBorder    = { fg = c.border, bg = c.bg_alt },
  FloatTitle     = { fg = c.cyan, bg = c.bg_alt, bold = true },
  NormalNC       = { fg = c.fg, bg = c.bg },
  Cursor         = { fg = c.bg, bg = c.amber },
  CursorLine     = { bg = c.bg_line },
  CursorColumn   = { bg = c.bg_line },
  CursorLineNr   = { fg = c.amber, bold = true },
  LineNr         = { fg = c.linenr },
  SignColumn     = { bg = c.bg },
  ColorColumn    = { bg = c.bg_line },
  Folded         = { fg = c.fg_dim, bg = c.bg_alt },
  FoldColumn     = { fg = c.linenr, bg = c.bg },
  VertSplit      = { fg = c.border },
  WinSeparator   = { fg = c.border },
  Visual         = { bg = c.bg_sel },
  VisualNOS      = { bg = c.bg_sel },
  Search         = { fg = c.bg, bg = c.amber },
  IncSearch      = { fg = c.bg, bg = c.amber_br },
  CurSearch      = { fg = c.bg, bg = c.amber_br },
  MatchParen     = { fg = c.cyan, bold = true, underline = true },
  Directory      = { fg = c.blue },
  Title          = { fg = c.cyan, bold = true },
  Question       = { fg = c.green },
  MoreMsg        = { fg = c.green },
  ModeMsg        = { fg = c.fg, bold = true },
  WarningMsg     = { fg = c.amber },
  ErrorMsg       = { fg = c.red, bold = true },
  NonText        = { fg = c.linenr },
  Whitespace     = { fg = c.linenr },
  SpecialKey     = { fg = c.linenr },
  Conceal        = { fg = c.fg_dim },
  EndOfBuffer    = { fg = c.bg },
  Pmenu          = { fg = c.fg, bg = c.bg_alt },
  PmenuSel       = { fg = c.white_br, bg = c.bg_sel, bold = true },
  PmenuSbar      = { bg = c.bg_alt },
  PmenuThumb     = { bg = c.border },
  StatusLine     = { fg = c.fg, bg = c.bg_sel },
  StatusLineNC   = { fg = c.fg_dim, bg = c.bg_alt },
  TabLine        = { fg = c.fg_dim, bg = c.bg_alt },
  TabLineSel     = { fg = c.bg, bg = c.cyan, bold = true },
  TabLineFill    = { bg = c.bg_alt },
  WinBar         = { fg = c.fg, bg = c.bg },
  WinBarNC       = { fg = c.fg_dim, bg = c.bg },
  QuickFixLine   = { bg = c.bg_sel, bold = true },
  Substitute     = { fg = c.bg, bg = c.amber_br },
  SpellBad       = { sp = c.red, undercurl = true },
  SpellCap       = { sp = c.amber, undercurl = true },
  SpellLocal     = { sp = c.cyan, undercurl = true },
  SpellRare      = { sp = c.purple, undercurl = true },

  -- syntax
  Comment        = { fg = c.comment, italic = true },
  Constant       = { fg = c.purple },
  String         = { fg = c.green },
  Character      = { fg = c.green },
  Number         = { fg = c.purple },
  Boolean        = { fg = c.purple },
  Float          = { fg = c.purple },
  Identifier     = { fg = c.fg },
  Function       = { fg = c.blue },
  Statement      = { fg = c.amber },
  Conditional    = { fg = c.amber },
  Repeat         = { fg = c.amber },
  Label          = { fg = c.blue },
  Operator       = { fg = c.fg_dim },
  Keyword        = { fg = c.amber },
  Exception      = { fg = c.amber },
  PreProc        = { fg = c.cyan },
  Include        = { fg = c.cyan },
  Define         = { fg = c.cyan },
  Macro          = { fg = c.cyan },
  PreCondit      = { fg = c.cyan },
  Type           = { fg = c.cyan },
  StorageClass   = { fg = c.cyan },
  Structure      = { fg = c.cyan },
  Typedef        = { fg = c.cyan },
  Special        = { fg = c.amber_br },
  SpecialChar    = { fg = c.amber_br },
  Tag            = { fg = c.blue },
  Delimiter      = { fg = c.fg_dim },
  SpecialComment = { fg = c.comment, bold = true },
  Debug          = { fg = c.purple },
  Underlined     = { fg = c.blue, underline = true },
  Ignore         = { fg = c.linenr },
  Error          = { fg = c.red, bold = true },
  Todo           = { fg = c.bg, bg = c.amber, bold = true },
  Added          = { fg = c.green },
  Changed        = { fg = c.amber },
  Removed        = { fg = c.red },

  -- diff
  DiffAdd        = { fg = c.green, bg = "#122620" },
  DiffChange     = { fg = c.amber, bg = "#26200F" },
  DiffDelete     = { fg = c.red, bg = "#2A1519" },
  DiffText       = { fg = c.bg, bg = c.amber },

  -- treesitter
  ["@comment"]              = { link = "Comment" },
  ["@comment.todo"]         = { link = "Todo" },
  ["@comment.note"]         = { fg = c.bg, bg = c.blue, bold = true },
  ["@comment.warning"]      = { fg = c.bg, bg = c.amber, bold = true },
  ["@comment.error"]        = { fg = c.bg, bg = c.red, bold = true },
  ["@string"]               = { fg = c.green },
  ["@string.escape"]        = { fg = c.amber_br },
  ["@string.special"]       = { fg = c.amber_br },
  ["@string.special.path"]  = { fg = c.green, underline = true },
  ["@string.regexp"]        = { fg = c.amber_br },
  ["@character"]            = { fg = c.green },
  ["@number"]               = { fg = c.purple },
  ["@boolean"]              = { fg = c.purple },
  ["@float"]                = { fg = c.purple },
  ["@constant"]             = { fg = c.purple },
  ["@constant.builtin"]     = { fg = c.purple },
  ["@constant.macro"]       = { fg = c.cyan },
  ["@variable"]             = { fg = c.fg },
  ["@variable.builtin"]     = { fg = c.purple, italic = true },
  ["@variable.parameter"]   = { fg = c.fg_dim },
  ["@variable.member"]      = { fg = c.blue },
  ["@field"]                = { fg = c.blue },
  ["@property"]             = { fg = c.blue },              -- yaml/json/hcl keys
  ["@function"]             = { fg = c.blue },
  ["@function.builtin"]     = { fg = c.blue },
  ["@function.call"]        = { fg = c.blue },
  ["@function.method"]      = { fg = c.blue },
  ["@function.method.call"] = { fg = c.blue },
  ["@function.macro"]       = { fg = c.cyan },
  ["@constructor"]          = { fg = c.cyan },
  ["@keyword"]              = { fg = c.amber },
  ["@keyword.function"]     = { fg = c.amber },
  ["@keyword.operator"]     = { fg = c.amber },
  ["@keyword.return"]       = { fg = c.amber },
  ["@keyword.conditional"]  = { fg = c.amber },
  ["@keyword.repeat"]       = { fg = c.amber },
  ["@keyword.import"]       = { fg = c.cyan },
  ["@keyword.exception"]    = { fg = c.amber },
  ["@keyword.directive"]    = { fg = c.cyan },              -- FROM, RUN, shebangs
  ["@conditional"]          = { fg = c.amber },
  ["@repeat"]               = { fg = c.amber },
  ["@include"]              = { fg = c.cyan },
  ["@operator"]             = { fg = c.fg_dim },
  ["@type"]                 = { fg = c.cyan },
  ["@type.builtin"]         = { fg = c.cyan },
  ["@type.definition"]      = { fg = c.cyan },
  ["@attribute"]            = { fg = c.cyan },
  ["@namespace"]            = { fg = c.fg },
  ["@module"]               = { fg = c.fg },
  ["@punctuation.delimiter"] = { fg = c.fg_dim },
  ["@punctuation.bracket"]  = { fg = c.fg_dim },
  ["@punctuation.special"]  = { fg = c.amber_br },          -- ${} interpolation
  ["@tag"]                  = { fg = c.blue },
  ["@tag.attribute"]        = { fg = c.cyan },
  ["@tag.delimiter"]        = { fg = c.fg_dim },
  ["@label"]                = { fg = c.blue },

  -- log files (targets MTDL9/vim-log-highlighting group names)
  -- severity colors match the terminal exactly, so a log reads the
  -- same whether you cat it or open it
  logLevelEmergency = { fg = c.bg, bg = c.red, bold = true },
  logLevelAlert     = { fg = c.bg, bg = c.red, bold = true },
  logLevelCritical  = { fg = c.red, bold = true },
  logLevelError     = { fg = c.red },
  logLevelWarning   = { fg = c.amber },
  logLevelNotice    = { fg = c.blue },
  logLevelInfo      = { fg = c.blue },
  logLevelDebug     = { fg = c.fg_dim },
  logLevelTrace     = { fg = c.comment },
  logDate           = { fg = c.cyan },
  logTime           = { fg = c.cyan },
  logTimeStamp      = { fg = c.cyan },
  logUrl            = { fg = c.blue, underline = true },
  logIPv4           = { fg = c.cyan_br },
  logIPv6           = { fg = c.cyan_br },
  logMacAddress     = { fg = c.cyan_br },
  logUUID           = { fg = c.purple },
  logMD5            = { fg = c.purple },
  logSHA            = { fg = c.purple },
  logString         = { fg = c.green },
  logNumber         = { fg = c.purple },
  logBoolean        = { fg = c.purple },
  logNull           = { fg = c.fg_dim },
  logFilePath       = { fg = c.green },
  logSysColumns     = { fg = c.fg_dim },
  logSyslogProc     = { fg = c.blue },

  -- config filetypes treesitter doesn't always cover
  yamlBlockMappingKey = { fg = c.blue },
  yamlAnchor          = { fg = c.purple },
  yamlAlias           = { fg = c.purple },
  yamlDocumentStart   = { fg = c.fg_dim },
  jsonKeyword         = { fg = c.blue },
  jsonQuote           = { fg = c.fg_dim },
  dockerfileKeyword   = { fg = c.amber },
  bashStatement       = { fg = c.amber },
  shDerefSimple       = { fg = c.purple },
  shDerefVar          = { fg = c.purple },
  shVariable          = { fg = c.purple },
  tomlTable           = { fg = c.blue, bold = true },
  tomlKey             = { fg = c.blue },
  iniLabel            = { fg = c.blue, bold = true },
  confComment         = { link = "Comment" },

  -- markdown
  ["@markup.heading"]       = { fg = c.cyan, bold = true },
  ["@markup.heading.1"]     = { fg = c.cyan, bold = true },
  ["@markup.heading.2"]     = { fg = c.blue, bold = true },
  ["@markup.heading.3"]     = { fg = c.green, bold = true },
  ["@markup.heading.4"]     = { fg = c.amber, bold = true },
  ["@markup.heading.5"]     = { fg = c.purple, bold = true },
  ["@markup.heading.6"]     = { fg = c.fg_dim, bold = true },
  ["@markup.strong"]        = { fg = c.white_br, bold = true },
  ["@markup.italic"]        = { fg = c.fg, italic = true },
  ["@markup.strikethrough"] = { fg = c.fg_dim, strikethrough = true },
  ["@markup.link"]          = { fg = c.blue, underline = true },
  ["@markup.link.url"]      = { fg = c.comment, underline = true },
  ["@markup.raw"]           = { fg = c.green },
  ["@markup.list"]          = { fg = c.amber },
  ["@markup.quote"]         = { fg = c.fg_dim, italic = true },

  -- lsp
  DiagnosticError            = { fg = c.red },
  DiagnosticWarn             = { fg = c.amber },
  DiagnosticInfo             = { fg = c.blue },
  DiagnosticHint             = { fg = c.cyan },
  DiagnosticOk               = { fg = c.green },
  DiagnosticUnderlineError   = { sp = c.red, undercurl = true },
  DiagnosticUnderlineWarn    = { sp = c.amber, undercurl = true },
  DiagnosticUnderlineInfo    = { sp = c.blue, undercurl = true },
  DiagnosticUnderlineHint    = { sp = c.cyan, undercurl = true },
  DiagnosticVirtualTextError = { fg = c.red, bg = "#2A1519" },
  DiagnosticVirtualTextWarn  = { fg = c.amber, bg = "#26200F" },
  DiagnosticVirtualTextInfo  = { fg = c.blue, bg = "#15202B" },
  DiagnosticVirtualTextHint  = { fg = c.cyan, bg = "#132428" },
  LspReferenceText           = { bg = c.bg_sel },
  LspReferenceRead           = { bg = c.bg_sel },
  LspReferenceWrite          = { bg = c.bg_sel, underline = true },
  LspSignatureActiveParameter = { fg = c.amber, bold = true },
  LspInlayHint               = { fg = c.linenr, bg = c.bg_line, italic = true },

  ["@lsp.type.class"]      = { fg = c.cyan },
  ["@lsp.type.function"]   = { fg = c.blue },
  ["@lsp.type.method"]     = { fg = c.blue },
  ["@lsp.type.parameter"]  = { fg = c.fg_dim },
  ["@lsp.type.property"]   = { fg = c.blue },
  ["@lsp.type.variable"]   = { fg = c.fg },
  ["@lsp.type.namespace"]  = { fg = c.fg },
  ["@lsp.type.enum"]       = { fg = c.cyan },
  ["@lsp.type.enumMember"] = { fg = c.purple },
  ["@lsp.type.decorator"]  = { fg = c.cyan },
  ["@lsp.type.comment"]    = {},

  -- telescope
  TelescopeNormal          = { fg = c.fg, bg = c.bg_alt },
  TelescopeBorder          = { fg = c.border, bg = c.bg_alt },
  TelescopeTitle           = { fg = c.fg_dim, bg = c.bg_alt },
  TelescopePromptNormal    = { fg = c.fg, bg = c.bg_sel },
  TelescopePromptBorder    = { fg = c.bg_sel, bg = c.bg_sel },
  TelescopePromptTitle     = { fg = c.bg, bg = c.cyan, bold = true },
  TelescopePromptPrefix    = { fg = c.amber },
  TelescopePromptCounter   = { fg = c.fg_dim },
  TelescopeResultsNormal   = { fg = c.fg, bg = c.bg_alt },
  TelescopeResultsBorder   = { fg = c.border, bg = c.bg_alt },
  TelescopeResultsTitle    = { fg = c.bg_alt, bg = c.bg_alt },
  TelescopePreviewNormal   = { fg = c.fg, bg = c.bg_alt },
  TelescopePreviewBorder   = { fg = c.border, bg = c.bg_alt },
  TelescopePreviewTitle    = { fg = c.bg, bg = c.green, bold = true },
  TelescopeSelection       = { fg = c.white_br, bg = c.bg_sel, bold = true },
  TelescopeSelectionCaret  = { fg = c.amber, bg = c.bg_sel },
  TelescopeMatching        = { fg = c.amber, bold = true },
  TelescopeMultiSelection  = { fg = c.purple },

  -- harpoon
  HarpoonWindow            = { fg = c.fg, bg = c.bg_alt },
  HarpoonBorder            = { fg = c.border, bg = c.bg_alt },
  HarpoonTitle             = { fg = c.bg, bg = c.cyan, bold = true },
  HarpoonInactive          = { fg = c.fg_dim },
  HarpoonActive            = { fg = c.white_br, bold = true },
  HarpoonNumberInactive    = { fg = c.linenr },
  HarpoonNumberActive      = { fg = c.amber },

  -- nvim-cmp
  CmpItemAbbr              = { fg = c.fg },
  CmpItemAbbrDeprecated    = { fg = c.fg_dim, strikethrough = true },
  CmpItemAbbrMatch         = { fg = c.amber, bold = true },
  CmpItemAbbrMatchFuzzy    = { fg = c.amber, bold = true },
  CmpItemMenu              = { fg = c.fg_dim, italic = true },
  CmpItemKindText          = { fg = c.fg },
  CmpItemKindVariable      = { fg = c.fg },
  CmpItemKindFunction      = { fg = c.blue },
  CmpItemKindMethod        = { fg = c.blue },
  CmpItemKindConstructor   = { fg = c.cyan },
  CmpItemKindClass         = { fg = c.cyan },
  CmpItemKindInterface     = { fg = c.cyan },
  CmpItemKindStruct        = { fg = c.cyan },
  CmpItemKindModule        = { fg = c.cyan },
  CmpItemKindKeyword       = { fg = c.amber },
  CmpItemKindSnippet       = { fg = c.purple },
  CmpItemKindConstant      = { fg = c.purple },
  CmpItemKindField         = { fg = c.blue },
  CmpItemKindProperty      = { fg = c.blue },
  CmpItemKindFile          = { fg = c.green },
  CmpItemKindFolder        = { fg = c.green },

  -- gitsigns
  GitSignsAdd              = { fg = c.green },
  GitSignsChange           = { fg = c.amber },
  GitSignsDelete           = { fg = c.red },
  GitSignsAddNr            = { fg = c.green },
  GitSignsChangeNr         = { fg = c.amber },
  GitSignsDeleteNr         = { fg = c.red },
  GitSignsAddLn            = { bg = "#122620" },
  GitSignsChangeLn         = { bg = "#26200F" },
  GitSignsDeleteLn         = { bg = "#2A1519" },
  GitSignsCurrentLineBlame = { fg = c.linenr, italic = true },

  -- render-markdown.nvim
  RenderMarkdownH1         = { fg = c.cyan, bold = true },
  RenderMarkdownH2         = { fg = c.blue, bold = true },
  RenderMarkdownH3         = { fg = c.green, bold = true },
  RenderMarkdownH4         = { fg = c.amber, bold = true },
  RenderMarkdownH5         = { fg = c.purple, bold = true },
  RenderMarkdownH6         = { fg = c.fg_dim, bold = true },
  RenderMarkdownH1Bg       = { fg = c.cyan, bg = "#132428", bold = true },
  RenderMarkdownH2Bg       = { fg = c.blue, bg = "#15202B", bold = true },
  RenderMarkdownH3Bg       = { fg = c.green, bg = "#122620", bold = true },
  RenderMarkdownH4Bg       = { fg = c.amber, bg = "#26200F", bold = true },
  RenderMarkdownH5Bg       = { fg = c.purple, bg = "#211A2B", bold = true },
  RenderMarkdownH6Bg       = { fg = c.fg_dim, bg = c.bg_alt, bold = true },
  RenderMarkdownCode       = { bg = c.bg_alt },
  RenderMarkdownCodeInline = { fg = c.green, bg = c.bg_alt },
  RenderMarkdownBullet     = { fg = c.amber },
  RenderMarkdownDash       = { fg = c.border },
  RenderMarkdownQuote      = { fg = c.fg_dim },
  RenderMarkdownLink       = { fg = c.blue, underline = true },
  RenderMarkdownTableHead  = { fg = c.cyan },
  RenderMarkdownTableRow   = { fg = c.fg_dim },
  RenderMarkdownTableFill  = { fg = c.bg },
  RenderMarkdownSuccess    = { fg = c.green },
  RenderMarkdownInfo       = { fg = c.blue },
  RenderMarkdownHint       = { fg = c.cyan },
  RenderMarkdownWarn       = { fg = c.amber },
  RenderMarkdownError      = { fg = c.red },
  RenderMarkdownUnchecked  = { fg = c.fg_dim },
  RenderMarkdownChecked    = { fg = c.green },
  RenderMarkdownTodo       = { fg = c.amber },
}

for group, opts in pairs(groups) do
  hi(group, opts)
end

-- :terminal ansi palette, identical to the terminator profile
vim.g.terminal_color_0  = c.bg_alt
vim.g.terminal_color_1  = c.red
vim.g.terminal_color_2  = c.green
vim.g.terminal_color_3  = c.amber
vim.g.terminal_color_4  = c.blue
vim.g.terminal_color_5  = c.purple
vim.g.terminal_color_6  = c.cyan
vim.g.terminal_color_7  = c.fg
vim.g.terminal_color_8  = "#4B5563"
vim.g.terminal_color_9  = c.red_br
vim.g.terminal_color_10 = c.green_br
vim.g.terminal_color_11 = c.amber_br
vim.g.terminal_color_12 = c.blue_br
vim.g.terminal_color_13 = c.purple_br
vim.g.terminal_color_14 = c.cyan_br
vim.g.terminal_color_15 = c.white_br
