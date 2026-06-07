vim.cmd("hi clear")
if vim.fn.exists("syntax_on") then
  vim.cmd("syntax reset")
end
vim.g.colors_name = "fl4my_green"
local hi = function(name, opts)
  vim.api.nvim_set_hl(0, name, opts)
end

-- EXACT PALETTE
-- bg:              #0C0D21  dark navy
-- fg:              #76b28f  normal green  → text, variables, functions, operators, punctuation
-- keyword_bright:  #b07bc4  bright purple → if, while, def, not, with, as
-- keyword_dim:     #855492  dim purple    → return, break
-- import:          #3E7580  teal          → import, from
-- string/number:   #D8A06A  orange        → strings, numbers
-- comment:         #16E519  bright green  → comments
-- dim:             #1e1f35  slightly lighter bg → UI elements

-- base
hi("Normal",        { fg = "#76b28f", bg = "#0C0D21" })
hi("NormalNC",      { bg = "#0C0D21" })
hi("SignColumn",    { bg = "#0C0D21" })
hi("EndOfBuffer",   { fg = "#1e1f35", bg = "#0C0D21" })

-- cursor & line
hi("CursorLine",    { bg = "NONE" })
-- hi("CursorLine",    { bg = "#13142e" }) -- uncomment this is you want a markedLine
hi("CursorLineNr",  { fg = "#76b28f", bold = true, bg = "#0C0D21" })
hi("LineNr",        { fg = "#2a2b45", bg = "#0C0D21" })

-- ui
hi("StatusLine",    { bg = "#13142e", fg = "#76b28f", bold = true })
hi("StatusLineNC",  { bg = "#0C0D21", fg = "#2a2b45" })
hi("WinSeparator",  { fg = "#1e1f35" })
hi("Visual",        { bg = "#1e2a35" })
hi("Search",        { fg = "#0C0D21", bg = "#76b28f" })
hi("IncSearch",     { fg = "#0C0D21", bg = "#D8A06A" })
hi("MatchParen",    { fg = "#b07bc4", bold = true })

-- pmenu
hi("Pmenu",         { fg = "#76b28f", bg = "#13142e" })
hi("PmenuSel",      { fg = "#0C0D21", bg = "#76b28f" })

-- diagnostics
hi("DiagnosticError",   { fg = "#ff5555" })
hi("DiagnosticWarn",    { fg = "#D8A06A" })
hi("DiagnosticInfo",    { fg = "#76b28f" })
hi("DiagnosticHint",    { fg = "#3E7580" })

-- syntax fallback
hi("Comment",       { fg = "#16E519", italic = true })
hi("String",        { fg = "#D8A06A" })
hi("Number",        { fg = "#D8A06A" })
hi("Float",         { fg = "#D8A06A" })
hi("Boolean",       { fg = "#D8A06A" })
hi("Keyword",       { fg = "#b07bc4" })           -- if while not with as
hi("Conditional",   { fg = "#b07bc4" })
hi("Repeat",        { fg = "#b07bc4" })
hi("Statement",     { fg = "#855492" })           -- return break
hi("Exception",     { fg = "#855492" })
hi("Function",      { fg = "#76b28f", bold = true })           -- same as fg
hi("Identifier",    { fg = "#76b28f" })
hi("Type",          { fg = "#76b28f" })
hi("Operator",      { fg = "#76b28f" })
hi("Special",       { fg = "#76b28f" })
hi("Delimiter",     { fg = "#76b28f" })
hi("PreProc",       { fg = "#3E7580" })           -- import from
hi("Include",       { fg = "#3E7580" })
hi("SpecialChar",   { fg = "#D8A06A" })

-- treesitter
hi("@keyword",                     { fg = "#b07bc4" })           -- if, while, with, as, in
hi("@keyword.conditional",         { fg = "#b07bc4" })           -- if, elif, else
hi("@keyword.function",            { fg = "#b07bc4" })           -- def, function
hi("@keyword.return",              { fg = "#855492" })           -- return
hi("@keyword.import",              { fg = "#3E7580" })           -- import, from
hi("@keyword.repeat",              { fg = "#b07bc4" })           -- while, for
hi("@keyword.exception",           { fg = "#855492" })           -- try, except, raise, finally
hi("@keyword.operator",            { fg = "#b07bc4" })           -- not, and, or
hi("@keyword.coroutine",           { fg = "#b07bc4" })           -- async, await
hi("@function",                    { fg = "#76b28f" })           -- function definitions
hi("@function.call",               { fg = "#76b28f" })           -- function calls
hi("@function.builtin",            { fg = "#76b28f" })           -- print, len, range, ...
hi("@function.method",             { fg = "#76b28f" })           -- method definitions
hi("@method",                      { fg = "#76b28f" })           -- method definitions (legacy)
hi("@method.call",                 { fg = "#76b28f" })           -- method calls
hi("@variable",                    { fg = "#76b28f" })           -- variables
hi("@variable.builtin",            { fg = "#76b28f" })           -- self, cls, this
hi("@parameter",                   { fg = "#76b28f" })           -- function parameters
hi("@string",                      { fg = "#D8A06A" })           -- "strings"
hi("@string.escape",               { fg = "#D8A06A" })           -- \n, \t, ...
hi("@number",                      { fg = "#D8A06A" })           -- 42, 0xFF
hi("@float",                       { fg = "#D8A06A" })           -- 3.14
hi("@boolean",                     { fg = "#D8A06A" })           -- true, false
hi("@comment",                     { fg = "#16E519", italic = true }) -- # comments
hi("@operator",                    { fg = "#76b28f" })           -- =, +, -, *, /
hi("@punctuation.bracket",         { fg = "#76b28f" })           -- (, ), [, ], {, }
hi("@punctuation.delimiter",       { fg = "#76b28f" })           -- ,, ;, .
hi("@type",                        { fg = "#76b28f" })           -- type names
hi("@type.builtin",                { fg = "#76b28f" })           -- int, str, list, dict
hi("@constant",                    { fg = "#76b28f" })           -- MY_CONST
hi("@constant.builtin",            { fg = "#76b28f" })           -- None, True, False
hi("@attribute",                   { fg = "#b07bc4" })           -- @decorator
hi("@property",                    { fg = "#76b28f" })           -- obj.property
hi("@field",                       { fg = "#76b28f" })           -- struct fields
hi("@namespace",                   { fg = "#76b28f" })           -- module names

vim.opt.cursorline = true
