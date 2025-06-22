local theme = {}

local p = {
  background = "#101010",
  foreground = "#b8b8a8",

  bark       = "#885858",
  bee        = "#b8a858",
  beetle     = "#1a1f1a",
  dark_leaf  = "#232b1f",
  dark_rock  = "#555555",
  dirt       = "#685818",
  fern       = "#989868",
  flower     = "#d58a4e",
  frog       = "#3f8f9f",
  ivy        = "#408050",
  lavender   = "#7050a0",
  leaf       = "#6f9f4f",
  lemon      = "#989848",
  moss       = "#5f8f4f",
  mushroom   = "#b84838",
  olive      = "#b2b790",
  rock       = "#586858",
  sand       = "#9d6d4d",
  pebble     = "#486878",
  squirrel   = "#a85858",
  water      = "#207080",
}

local highlights = {
  -- UI
  CursorLine                = { bg = p.beetle },
  StatusLine                = { fg = p.foreground },
  StatusLineNC              = { fg = p.rock, bg = p.beetle, italic = true },
  Visual                    = { bg = p.dark_leaf },

  -- Syntax
  Normal                    = { fg = p.foreground, bg = p.background },
  Comment                   = { fg = p.dark_rock, italic = true },
  Constant                  = { fg = p.dirt },
  Function                  = { fg = p.ivy },
  Identifier                = { fg = p.pebble },
  Keyword                   = { fg = p.sand },
  Number                    = { fg = p.squirrel },
  Operator                  = { fg = p.foreground },
  PreProc                   = { fg = p.sand },
  Punctuation               = { fg = p.bark },
  Special                   = { fg = p.bark },
  Statement                 = { fg = p.sand },
  String                    = { fg = p.lemon },
  Type                      = { fg = p.moss },

  -- Spelling
  SpellBad                  = { sp = p.sand, undercurl = true },

  -- Diagnostics
  DiagnosticError           = { fg = p.mushroom },
  DiagnosticWarn            = { fg = p.flower },
  DiagnosticInfo            = { fg = p.water },
  DiagnosticHint            = { fg = p.olive },
  DiagnosticUnnecessary     = { link = "DiagnosticHint" },
  DiagnosticUnderlineError  = { fg = p.mushroom, sp = p.mushroom },
  DiagnosticUnderlineWarn   = { fg = p.flower, sp = p.flower },
  DiagnosticUnderlineInfo   = { fg = p.frog, sp = p.frog },
  DiagnosticUnderlineHint   = { fg = p.olive, sp = p.olive },

  -- Floating Windows
  FloatBorder               = { fg = p.rock, bg = p.background },
  NormalFloat               = { fg = p.foreground, bg = p.background },
  FloatTitle                = { fg = p.bee, bg = p.background },

  -- Completion
  Pmenu                     = { fg = p.foreground, bg = p.beetle },
  PmenuSel                  = { fg = p.background, bg = p.rock },
  PmenuThumb                = { bg = p.dark_rock },
  PmenuSbar                 = { bg = p.ivy },

  -- Diff
  DiffAdd                   = { bg = "#183018" },
  DiffChange                = { bg = "#2a2a10" },
  DiffDelete                = { bg = "#301818" },
  DiffText                  = { bg = "#3a3a1a" },

  -- Treesitter
  ["@comment"]              = { link = "Comment" },
  ["@constant"]             = { link = "Constant" },
  ["@constructor"]          = { link = "Function" },
  ["@constructor.lua"]      = { link = "Punctuation" },
  ["@function"]             = { link = "Function" },
  ["@function.builtin"]     = { fg = p.water },
  ["@keyword"]              = { link = "Keyword" },
  ["@number"]               = { link = "Number" },
  ["@punctuation"]          = { link = "Punctuation" },
  ["@punctuation.bracket"]  = { link = "Punctuation" },
  ["@string"]               = { link = "String" },
  ["@string.documentation"] = { link = "Comment" },
  ["@type"]                 = { link = "Type" },
  ["@variable"]             = { link = "Identifier" },
  ["@variable.member"]      = { link = "Constant" },
  ["@variable.parameter"]   = { fg = p.leaf },

  -- NvimTree
  NvimTreeNormal            = { fg = p.foreground, bg = p.background },
  NvimTreeFolderName        = { fg = p.water },
  NvimTreeFolderIcon        = { fg = p.water },
  NvimTreeIndentMarker      = { fg = p.rock },
  NvimTreeGitDirty          = { fg = p.flower },
  NvimTreeGitNew            = { fg = p.leaf },
  NvimTreeGitDeleted        = { fg = p.squirrel },
  NvimTreeOpenedFile        = { fg = p.olive },
  NvimTreeModifiedFile      = { fg = p.bee },
  NvimTreeRootFolder        = { fg = p.sand, bold = true },
}

local lualine = {
  normal = {
    a = { fg = p.background, bg = p.rock, gui = "bold" },
    b = { fg = p.foreground, bg = p.beetle },
    c = { fg = p.foreground, bg = p.background },
  },
  command = {
    a = { fg = p.background, bg = p.water, gui = "bold" },
    b = { fg = p.foreground, bg = p.beetle },
    c = { fg = p.foreground, bg = p.background },
  },
  insert = {
    a = { fg = p.background, bg = p.fern, gui = "bold" },
    b = { fg = p.foreground, bg = p.beetle },
    c = { fg = p.foreground, bg = p.background },
  },
  visual = {
    a = { fg = p.background, bg = p.squirrel, gui = "bold" },
    b = { fg = p.foreground, bg = p.beetle },
    c = { fg = p.foreground, bg = p.background },
  },
  replace = {
    a = { fg = p.background, bg = p.sand, gui = "bold" },
    b = { fg = p.foreground, bg = p.beetle },
    c = { fg = p.foreground, bg = p.background },
  },
  inactive = {
    a = { fg = p.dirt, bg = p.beetle },
    b = { fg = p.dirt, bg = p.background },
    c = { fg = p.dirt, bg = p.background },
  },
}

theme.palette = p
theme.highlights = highlights
theme.lualine = lualine

-- Apply all highlight groups
function theme.load()
  vim.cmd("highlight clear")
  vim.opt.termguicolors = true
  vim.g.colors_name = "mytheme"

  for group, opts in pairs(theme.highlights) do
    vim.api.nvim_set_hl(0, group, opts)
  end
end

return theme
