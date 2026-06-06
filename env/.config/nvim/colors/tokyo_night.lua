-- fl4my_tokyo_night.lua — fl4mys3c personal colorscheme
-- bg: #1a1b26  fg: #c0caf5  TokyoNight Night
vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") then vim.cmd("syntax reset") end
vim.g.colors_name = "fl4my_tokyo_night"

-- ── Palette ───────────────────────────────────────────────────────────────────
local c = {
    bg          = "#1a1b26",   -- background
    bg_float    = "#16161e",   -- popups / floats
    bg_ui       = "#13131a",   -- statusline / tabline

    fg          = "#c0caf5",   -- foreground
    fg_dim      = "#444b6a",   -- comments / line numbers
    fg_dark     = "#32344a",   -- end of buffer / invisible

    comment     = "#444b6a",   -- comments
    visual      = "#283457",   -- visual selection
    match_paren = "#3d4179",   -- matching bracket bg

    -- syntax
    string_     = "#9ece6a",   -- strings                (green)
    builtin     = "#7aa2f7",   -- functions / methods    (blue)
    kw          = "#bb9af7",   -- all keywords           (purple)
    operator_   = "#89ddff",   -- == / = / += / …        (cyan)
    bracket_    = "#c0caf5",   -- ( ) [ ]                (fg)
    number_     = "#ff9e64",   -- numbers/floats          (orange)
    type_       = "#2ac3de",   -- types                   (cyan2)

    -- ui accents
    accent      = "#7aa2f7",   -- border / active / search (blue)
    br_red      = "#f7768e",   -- errors                  (red)
    br_yellow   = "#e0af68",   -- warnings                (yellow)
    br_cyan     = "#2ac3de",   -- fields / escape          (cyan)
    br_blue     = "#7dcfff",   -- diagnostic info          (light blue)

    -- diff
    diff_add    = "#1c2e21",
    diff_change = "#1c2030",
    diff_remove = "#2d1f27",
    diff_text   = "#1f3044",
}

local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
end

-- ── UI / Chrome ───────────────────────────────────────────────────────────────
hi("Normal",            { fg = c.fg,       bg = c.bg,       bold = true })
hi("NormalFloat",       { fg = c.fg,       bg = c.bg_float, bold = true })
hi("FloatBorder",       { fg = c.accent,   bg = c.bg_float, bold = true })
hi("Cursor",            { fg = c.bg,       bg = c.fg,       bold = true })
hi("CursorLine",        { bold = true })
hi("CursorLineNr",      { fg = c.fg_dim,                    bold = true })
hi("LineNr",            { fg = c.fg_dim,                    bold = true })
hi("SignColumn",        { bg = c.bg,                        bold = true })
hi("ColorColumn",       { bg = c.bg,                        bold = true })
hi("VertSplit",         { fg = c.accent,                    bold = true })
hi("WinSeparator",      { fg = c.accent,                    bold = true })
hi("EndOfBuffer",       { fg = c.fg_dark,                   bold = true })
hi("NonText",           { fg = c.fg_dim,                    bold = true })
hi("SpecialKey",        { fg = c.fg_dim,                    bold = true })

-- ── Statusline / Tabs ─────────────────────────────────────────────────────────
hi("StatusLine",        { fg = c.bg,       bg = c.fg,       bold = true })
hi("StatusLineNC",      { fg = c.fg_dim,   bg = c.bg,       bold = true })
hi("TabLine",           { fg = c.fg_dim,   bg = c.bg_ui,    bold = true })
hi("TabLineSel",        { fg = c.fg,       bg = c.bg,       bold = true })
hi("TabLineFill",       { bg = c.bg_ui,                     bold = true })

-- ── Popup Menu ────────────────────────────────────────────────────────────────
hi("Pmenu",             { fg = c.fg,       bg = c.bg_float, bold = true })
hi("PmenuSel",          { fg = c.bg,       bg = c.accent,   bold = true })
hi("PmenuSbar",         { bg = c.bg_float,                  bold = true })
hi("PmenuThumb",        { bg = c.fg_dim,                    bold = true })

-- ── Selection / Search ────────────────────────────────────────────────────────
hi("Visual",            { bg = c.visual,                    bold = true })
hi("Search",            { fg = c.bg,       bg = c.br_yellow,bold = true })
hi("IncSearch",         { fg = c.bg,       bg = c.accent,   bold = true })
hi("MatchParen",        { bg = c.match_paren,               bold = true })

-- ── Misc UI ───────────────────────────────────────────────────────────────────
hi("Folded",            { fg = c.fg_dim,   bg = c.bg,       bold = true })
hi("FoldColumn",        { fg = c.fg_dim,   bg = c.bg,       bold = true })
hi("Directory",         { fg = c.accent,                    bold = true })
hi("Title",             { fg = c.accent,                    bold = true })
hi("ErrorMsg",          { fg = c.br_red,                    bold = true })
hi("WarningMsg",        { fg = c.br_yellow,                 bold = true })
hi("MoreMsg",           { fg = c.fg,                        bold = true })
hi("ModeMsg",           { fg = c.fg,                        bold = true })
hi("Question",          { fg = c.accent,                    bold = true })
hi("SpellBad",          { undercurl = true, sp = c.br_red,  bold = true })
hi("SpellWarn",         { undercurl = true, sp = c.br_yellow,bold = true })

-- ── Diff ──────────────────────────────────────────────────────────────────────
hi("DiffAdd",           { bg = c.diff_add,                  bold = true })
hi("DiffChange",        { bg = c.diff_change,               bold = true })
hi("DiffDelete",        { bg = c.diff_remove,               bold = true })
hi("DiffText",          { bg = c.diff_text,                 bold = true })

-- ── Syntax (legacy / fallback) ────────────────────────────────────────────────
hi("Comment",           { fg = c.comment,  italic = true,   bold = true })
hi("String",            { fg = c.string_,                   bold = true })
hi("Character",         { fg = c.string_,                   bold = true })
hi("Number",            { fg = c.number_,                   bold = true })
hi("Float",             { fg = c.number_,                   bold = true })
hi("Boolean",           { fg = c.br_red,                    bold = true })
hi("Constant",          { fg = c.kw,                        bold = true })
hi("Identifier",        { fg = c.fg,                        bold = true })
hi("Function",          { fg = c.builtin,                   bold = true })
hi("Statement",         { fg = c.kw,                        bold = true })
hi("Conditional",       { fg = c.kw,                        bold = true })
hi("Repeat",            { fg = c.kw,                        bold = true })
hi("Label",             { fg = c.kw,                        bold = true })
hi("Keyword",           { fg = c.kw,                        bold = true })
hi("Exception",         { fg = c.kw,                        bold = true })
hi("Include",           { fg = c.kw,                        bold = true })
hi("Define",            { fg = c.kw,                        bold = true })
hi("PreProc",           { fg = c.kw,                        bold = true })
hi("Macro",             { fg = c.kw,                        bold = true })
hi("Operator",          { fg = c.operator_,                 bold = true })
hi("Delimiter",         { fg = c.bracket_,                  bold = true })
hi("Type",              { fg = c.type_,                     bold = true })
hi("StorageClass",      { fg = c.kw,                        bold = true })
hi("Structure",         { fg = c.kw,                        bold = true })
hi("Typedef",           { fg = c.type_,                     bold = true })
hi("Special",           { fg = c.br_cyan,                   bold = true })
hi("Error",             { fg = c.br_red,                    bold = true })
hi("Todo",              { fg = c.br_yellow,                 bold = true })
hi("Underlined",        { underline = false })

-- ── Treesitter ────────────────────────────────────────────────────────────────
hi("@comment",                      { link = "Comment" })
hi("@string",                       { fg = c.string_,                   bold = true })
hi("@string.escape",                { fg = c.br_cyan,                   bold = true })
hi("@character",                    { fg = c.string_,                   bold = true })
hi("@number",                       { fg = c.number_,                   bold = true })
hi("@float",                        { fg = c.number_,                   bold = true })
hi("@boolean",                      { fg = c.br_red,                    bold = true })
hi("@constant",                     { fg = c.kw,                        bold = true })
hi("@constant.builtin",             { fg = c.kw,                        bold = true })
hi("@variable",                     { fg = c.fg,                        bold = true })
hi("@variable.builtin",             { fg = c.kw,                        bold = true })
hi("@parameter",                    { fg = c.fg,       italic = true,   bold = true })
hi("@function",                     { fg = c.builtin,                   bold = true })
hi("@function.builtin",             { fg = c.builtin,                   bold = true })
hi("@function.call",                { fg = c.builtin,                   bold = true })
hi("@method",                       { fg = c.builtin,                   bold = true })
hi("@method.call",                  { fg = c.builtin,                   bold = true })
hi("@keyword",                      { fg = c.kw,                        bold = true })
hi("@keyword.function",             { fg = c.kw,                        bold = true })
hi("@keyword.class",                { fg = c.kw,                        bold = true })
hi("@keyword.match",                { fg = c.kw,                        bold = true })
hi("@keyword.return",               { fg = c.kw,                        bold = true })
hi("@keyword.operator",             { fg = c.operator_,                 bold = true })
hi("@keyword.import",               { fg = c.kw,                        bold = true })
hi("@keyword.exception",            { fg = c.kw,                        bold = true })
hi("@keyword.conditional",          { fg = c.kw,                        bold = true })
hi("@keyword.repeat",               { fg = c.kw,                        bold = true })
hi("@conditional",                  { fg = c.kw,                        bold = true })
hi("@repeat",                       { fg = c.kw,                        bold = true })
hi("@operator",                     { fg = c.operator_,                 bold = true })
hi("@punctuation.bracket",          { fg = c.bracket_,                  bold = true })
hi("@punctuation.delimiter",        { fg = c.fg,                        bold = true })
hi("@punctuation.special",          { fg = c.br_cyan,                   bold = true })
hi("@type",                         { fg = c.type_,                     bold = true })
hi("@type.builtin",                 { fg = c.builtin,                   bold = true })
hi("@field",                        { fg = c.br_cyan,                   bold = true })
hi("@property",                     { fg = c.br_cyan,                   bold = true })
hi("@namespace",                    { fg = c.fg,                        bold = true })
hi("@module",                       { fg = c.fg,                        bold = true })
hi("@include",                      { fg = c.kw,                        bold = true })
hi("@exception",                    { fg = c.kw,                        bold = true })

-- ── LSP / Diagnostics ─────────────────────────────────────────────────────────
hi("DiagnosticError",               { fg = c.br_red,                    bold = true })
hi("DiagnosticWarn",                { fg = c.br_yellow,                 bold = true })
hi("DiagnosticInfo",                { fg = c.br_blue,                   bold = true })
hi("DiagnosticHint",                { fg = c.br_cyan,                   bold = true })
hi("DiagnosticUnderlineError",      { undercurl = true, sp = c.br_red })
hi("DiagnosticUnderlineWarn",       { undercurl = true, sp = c.br_yellow })
hi("DiagnosticUnderlineInfo",       { undercurl = true, sp = c.br_blue })
hi("DiagnosticUnderlineHint",       { undercurl = true, sp = c.br_cyan })
hi("LspReferenceText",              { bg = c.visual,                    bold = true })
hi("LspReferenceRead",              { bg = c.visual,                    bold = true })
hi("LspReferenceWrite",             { bg = c.visual,                    bold = true })

-- ── Netrw ─────────────────────────────────────────────────────────────────────
hi("netrwDir",                      { fg = c.br_cyan,                   bold = true })
hi("netrwClassify",                 { fg = c.br_cyan,                   bold = true })
