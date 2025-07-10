local theme = {}

local p = {
  background      = "#101010",
  foreground      = "#a8a898",

  add             = "#104010",
  add_light       = "#308030",
  change          = "#404000",
  change_light    = "#a0a000",
  delete          = "#602010",
  delete_light    = "#a03020",
  untracked       = "#404040",
  untracked_light = "#808080",

  bark            = "#885858",
  bee             = "#b8a858",
  beetle          = "#202020",
  dark_leaf       = "#232b1f",
  dark_rock       = "#555555",
  dirt            = "#706020",
  fern            = "#989868",
  flower          = "#d58a4e",
  frog            = "#3f8f9f",
  ivy             = "#408050",
  lavender        = "#7050a0",
  leaf            = "#6f9f4f",
  lemon           = "#989848",
  moss            = "#609050",
  mushroom        = "#b84838",
  olive           = "#b2b790",
  rock            = "#586858",
  sand            = "#9d6d4d",
  starling        = "#1a1f1a",
  pebble          = "#507080",
  squirrel        = "#a85858",
  water           = "#207080",
}

local highlights = {
  -- UI
  CursorLine                = { bg = p.starling },
  StatusLine                = { fg = p.foreground },
  StatusLineNC              = { fg = p.rock, bg = p.starling, italic = true },
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

  -- Search
  CurSearch                 = { fg = p.starling, bg = p.fern },
  Search                    = { fg = p.starling, bg = p.rock },

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
  FloatTitle                = { fg = p.bee, bg = p.background, bold = true },

  -- Completion
  Pmenu                     = { fg = p.foreground, bg = p.background },
  PmenuSel                  = { fg = p.background, bg = p.rock },
  PmenuThumb                = { bg = p.dark_rock },
  PmenuSbar                 = { bg = p.ivy },

  -- Diff
  DiffAdd                   = { bg = p.add },
  DiffChange                = { bg = p.change },
  DiffDelete                = { bg = p.delete },
  DiffText                  = { bg = p.untracked },

  -- Gitsigns
  GitSignsAdd               = { fg = p.add },
  GitSignsChange            = { fg = p.change },
  GitSignsDelete            = { fg = p.delete },
  GitSignsUntracked         = { fg = p.untracked },

  -- LuaLine
  LuaLineDiffAdd            = { fg = p.add_light },
  LuaLineDiffChange         = { fg = p.change_light },
  LuaLineDiffDelete         = { fg = p.delete_light },

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
  ["@variable.member"]      = { fg = p.fern },
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

  -- nvim-cmp
  CmpGhostText              = { fg = p.foreground, italic = true },

  -- nvim-cursorword
  CursorWord                = { underline = true },
}

local lualine = {
  normal = {
    a = { fg = p.background, bg = p.rock, gui = "bold" },
    b = { fg = p.foreground, bg = p.starling },
    c = { fg = p.foreground, bg = p.background },
  },
  command = {
    a = { fg = p.background, bg = p.water, gui = "bold" },
    b = { fg = p.foreground, bg = p.starling },
    c = { fg = p.foreground, bg = p.background },
  },
  insert = {
    a = { fg = p.background, bg = p.fern, gui = "bold" },
    b = { fg = p.foreground, bg = p.starling },
    c = { fg = p.foreground, bg = p.background },
  },
  visual = {
    a = { fg = p.background, bg = p.squirrel, gui = "bold" },
    b = { fg = p.foreground, bg = p.starling },
    c = { fg = p.foreground, bg = p.background },
  },
  replace = {
    a = { fg = p.background, bg = p.sand, gui = "bold" },
    b = { fg = p.foreground, bg = p.starling },
    c = { fg = p.foreground, bg = p.background },
  },
  inactive = {
    a = { fg = p.dirt, bg = p.starling },
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
