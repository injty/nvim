-- Cinderline for Neovim. Palette source: themes/cinderline.json.
vim.o.background = "dark"
vim.cmd("highlight clear")
vim.g.colors_name = "cinderline"

local p = {
  base = "#101010", editor = "#151515", surface = "#1C1C1C", menu = "#242424",
  selected = "#2E2E2E", divider = "#2B2B2B", border = "#383838",
  text = "#D6D6D6", silver = "#CCCCCC", muted = "#B0B0B0", disabled = "#737373",
  orange = "#D99565", sage = "#A7B89F", red = "#DD9387",
}

local groups = {
  Normal = { fg = p.text, bg = p.editor },
  Cursor = { fg = p.editor, bg = p.orange },
  CursorLine = { bg = p.surface },
  CursorLineNr = { fg = p.orange, bold = true },
  LineNr = { fg = p.disabled },
  SignColumn = { fg = p.disabled, bg = p.editor },
  NonText = { fg = "#424242" },
  EndOfBuffer = { fg = p.divider },
  ColorColumn = { bg = p.surface },
  Folded = { fg = p.muted, bg = p.surface },
  WinSeparator = { fg = p.divider },
  StatusLine = { fg = p.text, bg = p.base },
  StatusLineNC = { fg = p.muted, bg = p.base },
  TabLineSel = { fg = p.orange, bg = p.editor, bold = true },
  NormalFloat = { fg = p.text, bg = p.menu },
  FloatBorder = { fg = p.border, bg = p.menu },
  PmenuSel = { fg = p.text, bg = p.selected, bold = true },
  PmenuSbar = { bg = p.surface },
  PmenuThumb = { bg = p.border },

  -- Zed's alpha overlays composited over editor.background (#151515).
  Visual = { bg = "#2C2C2C" }, -- #CCCCCC20
  Search = { fg = p.text, bg = "#312720" }, -- #D9956524
  CurSearch = { fg = p.text, bg = "#3A2D24", bold = true }, -- #D9956530
  MatchParen = { bg = "#2C2C2C", bold = true },
  LspReferenceRead = { bg = "#232323" }, -- #CCCCCC14
  LspReferenceWrite = { bg = "#29221D" }, -- #D995651A
  DiffAdd = { bg = "#272926" }, -- #A7B89F20
  DiffDelete = { fg = p.red, bg = "#2E2523" }, -- #DD938720
  DiffChange = { bg = "#262626" }, -- #CCCCCC18
  DiffText = { fg = p.silver, bg = p.border, bold = true },

  Identifier = { fg = p.text },
  Comment = { fg = p.muted },
  Operator = { fg = p.muted },
  Function = { fg = p.silver },
  String = { fg = p.sage },
  Constant = { fg = p.red },
  Statement = { fg = p.orange },
  Title = { fg = p.orange, bold = true },
  Todo = { fg = p.orange, bold = true },
  Underlined = { fg = p.silver, underline = true },
  ["@markup.italic"] = { italic = true },
  ["@markup.strong"] = { bold = true },
  ["@markup.strikethrough"] = { strikethrough = true },
  LspInlayHint = { fg = p.muted, bg = p.surface },
  Added = { fg = p.sage },
  Changed = { fg = p.silver },
  Removed = { fg = p.red },
}

-- Standard syntax, Tree-sitter captures and LSP semantic tokens share roles.
local aliases = {
  Cursor = { "lCursor", "TermCursor" },
  CursorLine = { "CursorColumn" },
  NonText = { "Whitespace", "SpecialKey" },
  SignColumn = { "FoldColumn" },
  StatusLineNC = { "TabLine", "TabLineFill" },
  NormalFloat = { "Pmenu" },
  PmenuSel = { "WildMenu" },
  CurSearch = { "IncSearch" },
  LspReferenceRead = { "LspReferenceText" },
  Identifier = { "@variable", "@lsp.type.variable", "@markup.link.label" },
  Operator = { "Delimiter", "@punctuation", "@tag.delimiter" },
  Function = {
    "Label", "@attribute", "@module", "@property", "@variable.member", "@variable.parameter",
    "@tag.attribute", "@string.special", "@lsp.type.namespace", "@lsp.type.property",
    "@lsp.type.parameter", "@lsp.type.method", "@lsp.type.decorator",
  },
  Constant = {
    "Number", "Boolean", "Float", "Type", "Special", "Character",
    "@constructor", "@variable.builtin", "@string.escape", "@string.regexp",
    "@string.special.symbol", "@punctuation.special", "@lsp.type.enumMember",
  },
  Statement = { "Keyword", "PreProc", "@tag", "@markup.list", "Directory", "ModeMsg", "Question" },
  String = { "@markup.raw" },
  Title = { "@markup.heading", "FloatTitle" },
  Underlined = { "@markup.link.url" },
  Added = { "GitSignsAdd", "diffAdded", "@diff.plus" },
  Changed = { "GitSignsChange", "diffChanged", "@diff.delta" },
  Removed = { "GitSignsDelete", "diffRemoved", "@diff.minus" },
  DiagnosticError = { "Error", "ErrorMsg" },
  DiagnosticWarn = { "WarningMsg" },
}

for severity, color in pairs({
  Error = p.red, Warn = p.orange, Info = p.silver, Hint = p.silver, Ok = p.sage,
}) do
  groups["Diagnostic" .. severity] = { fg = color }
  groups["DiagnosticUnderline" .. severity] = { sp = color, undercurl = true }
end

for name, style in pairs(groups) do
  vim.api.nvim_set_hl(0, name, style)
end
for target, names in pairs(aliases) do
  for _, name in ipairs(names) do
    vim.api.nvim_set_hl(0, name, { link = target })
  end
end

local ansi = {
  p.divider, p.red, p.sage, p.orange, p.silver, p.muted, p.silver, p.text,
  p.muted, p.red, p.sage, p.orange, p.text, p.silver, p.text, p.text,
}
for i, color in ipairs(ansi) do
  vim.g["terminal_color_" .. (i - 1)] = color
end
