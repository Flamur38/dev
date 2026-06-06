-- fl4my_sublime.lua — fl4mys3c personal colorscheme
-- bg: #23282f  fg: #d8dee9  inspired by Sublime Text / Oceanic Next
vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") then vim.cmd("syntax reset") end
vim.g.colors_name = "fl4my_sublime"

-- ── Palette ───────────────────────────────────────────────────────────────────
local c = {
    bg          = "#23282f",   -- background
    -- bg          = "#191D22",   -- background
    -- bg          = "#000000",   -- background
    bg_float    = "#303841",   -- popups / floats
    bg_ui       = "#444e59",   -- statusline / tabline

    fg          = "#d8dee9",   -- foreground
    fg_dim      = "#a6acb9",   -- comments / line numbers
    fg_dark     = "#46525c",   -- end of buffer / invisible

    -- comment     = "#a6acb9",   -- comments
    comment     = "#888E9B",   -- visual selection
    visual      = "#3f4750",   -- visual selection
    match_paren = "#444e59",   -- matching bracket bg

    -- syntax
    string_     = "#99c794",   -- strings                (green)
    builtin     = "#5c99d6",   -- print() / functions    (blue2)
    kw          = "#c695c6",   -- all keywords           (magenta)
    operator_   = "#f97b58",   -- == / = / += / …        (orange)
    bracket_    = "#d8dee9",   -- ( ) [ ]                (fg)
    number_     = "#f9ae58",   -- numbers/floats          (yellow2)
    type_       = "#5fb4b4",   -- types                   (cyan2)

    -- ui accents
    accent      = "#5c99d6",   -- border / active / search (blue2)
    br_red      = "#ec5f66",   -- errors                  (red2)
    br_yellow   = "#fac761",   -- warnings                (yellow1)
    br_cyan     = "#87c7c7",   -- fields / escape          (cyan1)
    br_blue     = "#95b2d6",   -- diagnostic info          (blue1)

    -- diff
    diff_add    = "#41525a",
    diff_change = "#585249",
    diff_remove = "#4f434a",
    diff_text   = "#373f48",
}

local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
end

-- ── UI / Chrome ───────────────────────────────────────────────────────────────
hi("Normal",            { fg = c.fg,         bg = c.bg })
hi("NormalFloat",       { fg = c.fg,         bg = c.bg_float })
hi("FloatBorder",       { fg = c.accent,     bg = c.bg_float })
hi("Cursor",            { fg = c.bg,         bg = c.fg })
hi("CursorLine",        { })
hi("CursorLineNr",      { fg = c.fg_dim })
hi("LineNr",            { fg = c.fg_dim })
hi("SignColumn",        { bg = c.bg })
hi("ColorColumn",       { bg = c.bg })
hi("VertSplit",         { fg = c.accent })
hi("WinSeparator",      { fg = c.accent })
hi("EndOfBuffer",       { fg = c.fg_dark })
hi("NonText",           { fg = c.fg_dim })
hi("SpecialKey",        { fg = c.fg_dim })

-- ── Statusline / Tabs ─────────────────────────────────────────────────────────
hi("StatusLine",        { fg = c.bg, bold = true,     bg = c.fg })
hi("StatusLineNC",      { fg = c.fg_dim,     bg = c.bg })
hi("TabLine",           { fg = c.fg_dim,     bg = c.bg_ui })
hi("TabLineSel",        { fg = c.fg,         bg = c.bg })
hi("TabLineFill",       { bg = c.bg_ui })

-- ── Popup Menu ────────────────────────────────────────────────────────────────
hi("Pmenu",             { fg = c.fg,         bg = c.bg_float })
hi("PmenuSel",          { fg = c.bg,         bg = c.accent })
hi("PmenuSbar",         { bg = c.bg_float })
hi("PmenuThumb",        { bg = c.fg_dim })

-- ── Selection / Search ────────────────────────────────────────────────────────
hi("Visual",            { bg = c.visual })
hi("Search",            { fg = c.bg,         bg = c.br_yellow })
hi("IncSearch",         { fg = c.bg,         bg = c.accent })
hi("MatchParen",        { bg = c.match_paren })

-- ── Misc UI ───────────────────────────────────────────────────────────────────
hi("Folded",            { fg = c.fg_dim,     bg = c.bg })
hi("FoldColumn",        { fg = c.fg_dim,     bg = c.bg })
hi("Directory",         { fg = c.accent })
hi("Title",             { fg = c.accent })
hi("ErrorMsg",          { fg = c.br_red })
hi("WarningMsg",        { fg = c.br_yellow })
hi("MoreMsg",           { fg = c.fg })
hi("ModeMsg",           { fg = c.fg })
hi("Question",          { fg = c.accent })
hi("SpellBad",          { undercurl = true,  sp = c.br_red })
hi("SpellWarn",         { undercurl = true,  sp = c.br_yellow })

-- ── Diff ──────────────────────────────────────────────────────────────────────
hi("DiffAdd",           { bg = c.diff_add })
hi("DiffChange",        { bg = c.diff_change })
hi("DiffDelete",        { bg = c.diff_remove })
hi("DiffText",          { bg = c.diff_text })

-- ── Syntax (legacy / fallback) ────────────────────────────────────────────────
hi("Comment",           { fg = c.comment,    italic = true })
hi("String",            { fg = c.string_ })
hi("Character",         { fg = c.string_ })
hi("Number",            { fg = c.number_ })
hi("Float",             { fg = c.number_ })
hi("Boolean",           { fg = c.br_red })
hi("Constant",          { fg = c.kw })
hi("Identifier",        { fg = c.fg })
hi("Function",          { fg = c.builtin})
hi("Statement",         { fg = c.kw })
hi("Conditional",       { fg = c.kw })
hi("Repeat",            { fg = c.kw })
hi("Label",             { fg = c.kw })
hi("Keyword",           { fg = c.kw })
hi("Exception",         { fg = c.kw })
hi("Include",           { fg = c.kw })
hi("Define",            { fg = c.kw })
hi("PreProc",           { fg = c.kw })
hi("Macro",             { fg = c.kw })
hi("Operator",          { fg = c.operator_ })
hi("Delimiter",         { fg = c.bracket_})
hi("Type",              { fg = c.type_ })
hi("StorageClass",      { fg = c.kw })
hi("Structure",         { fg = c.kw })
hi("Typedef",           { fg = c.type_ })
hi("Special",           { fg = c.br_cyan })
hi("Error",             { fg = c.br_red })
hi("Todo",              { fg = c.br_yellow })
hi("Underlined",        { underline = false })

-- ── Treesitter ────────────────────────────────────────────────────────────────
hi("@comment",                      { link = "Comment" })
hi("@string",                       { fg = c.string_ })
hi("@string.escape",                { fg = c.br_cyan })
hi("@character",                    { fg = c.string_ })
hi("@number",                       { fg = c.number_ })
hi("@float",                        { fg = c.number_ })
hi("@boolean",                      { fg = c.br_red })
hi("@constant",                     { fg = c.kw })
hi("@constant.builtin",             { fg = c.kw })
hi("@variable",                     { fg = c.fg })
hi("@variable.builtin",             { fg = c.kw })
hi("@parameter",                    { fg = c.fg,           italic = true })
hi("@function",                     { fg = c.builtin })
hi("@function.builtin",             { fg = c.builtin })
hi("@function.call",                { fg = c.builtin })
hi("@method",                       { fg = c.builtin })
hi("@method.call",                  { fg = c.builtin })
hi("@keyword",                      { fg = c.kw })
hi("@keyword.function",             { fg = c.kw })
hi("@keyword.class",                { fg = c.kw })
hi("@keyword.match",                { fg = c.kw })
hi("@keyword.return",               { fg = c.kw })
hi("@keyword.operator",             { fg = c.operator_ })  -- in / not / and / or → same as = ==
hi("@keyword.import",               { fg = c.kw })
hi("@keyword.exception",            { fg = c.kw })
hi("@keyword.conditional",          { fg = c.kw })
hi("@keyword.repeat",               { fg = c.kw })
hi("@conditional",                  { fg = c.kw })
hi("@repeat",                       { fg = c.kw })
hi("@operator",                     { fg = c.operator_ })
hi("@punctuation.bracket",          { fg = c.bracket_})
hi("@punctuation.delimiter",        { fg = c.fg })
hi("@punctuation.special",          { fg = c.br_cyan })
hi("@type",                         { fg = c.type_ })
hi("@type.builtin",                 { fg = c.builtin })
hi("@field",                        { fg = c.br_cyan })
hi("@property",                     { fg = c.br_cyan })
hi("@namespace",                    { fg = c.fg })
hi("@module",                       { fg = c.fg })
hi("@include",                      { fg = c.kw })
hi("@exception",                    { fg = c.kw })

-- ── LSP / Diagnostics ─────────────────────────────────────────────────────────
hi("DiagnosticError",               { fg = c.br_red })
hi("DiagnosticWarn",                { fg = c.br_yellow })
hi("DiagnosticInfo",                { fg = c.br_blue })
hi("DiagnosticHint",                { fg = c.br_cyan })
hi("DiagnosticUnderlineError",      { undercurl = true, sp = c.br_red })
hi("DiagnosticUnderlineWarn",       { undercurl = true, sp = c.br_yellow })
hi("DiagnosticUnderlineInfo",       { undercurl = true, sp = c.br_blue })
hi("DiagnosticUnderlineHint",       { undercurl = true, sp = c.br_cyan })
hi("LspReferenceText",              { bg = c.visual })
hi("LspReferenceRead",              { bg = c.visual })
hi("LspReferenceWrite",             { bg = c.visual })

-- ── Netrw ─────────────────────────────────────────────────────────────────────
hi("netrwDir",                      { fg = c.br_cyan })
hi("netrwClassify",                 { fg = c.br_cyan })

