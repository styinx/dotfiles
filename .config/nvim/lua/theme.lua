local theme = {}

local p = {
  background      = "#0C0C0C",
  foreground      = "#a8a8a8",

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
  butterfly       = "#a87e0e",
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
  void            = "#101010",
  water           = "#207080",
}

local highlights = {
  -- UI
  CursorLine                               = { bg = p.starling },
  StatusLine                               = { fg = p.foreground },
  StatusLineNC                             = { fg = p.rock, bg = p.starling, italic = true },
  Visual                                   = { fg = p.foreground, bg = p.dark_leaf },

  -- Syntax
  Normal                                   = { fg = p.foreground, bg = p.background },
  Comment                                  = { fg = p.dark_rock, italic = true },
  Constant                                 = { fg = p.frog },
  Enum                                     = { fg = p.moss },
  Function                                 = { fg = p.ivy },
  Identifier                               = { fg = p.pebble },
  Keyword                                  = { fg = p.sand },
  Number                                   = { fg = p.squirrel },
  Operator                                 = { fg = p.sand },
  PreProc                                  = { fg = p.sand },
  Punctuation                              = { fg = p.bark },
  Special                                  = { fg = p.butterfly },
  Statement                                = { fg = p.sand },
  String                                   = { fg = p.lemon },
  Structure                                = { fg = p.sand },
  Title                                    = { fg = p.moss },
  Type                                     = { fg = p.moss },

  -- Search
  CurSearch                                = { fg = p.starling, bg = p.fern },
  Search                                   = { fg = p.starling, bg = p.rock },
  IncSearch                                = { fg = p.starling, bg = p.rock },

  -- Spelling
  SpellBad                                 = { sp = p.sand, undercurl = true },

  -- Diagnostics
  DiagnosticError                          = { fg = p.mushroom },
  DiagnosticWarn                           = { fg = p.flower },
  DiagnosticInfo                           = { fg = p.water },
  DiagnosticHint                           = { fg = p.olive },
  DiagnosticUnnecessary                    = { link = "DiagnosticHint" },
  DiagnosticUnderlineError                 = { fg = p.mushroom, sp = p.mushroom },
  DiagnosticUnderlineWarn                  = { fg = p.flower, sp = p.flower },
  DiagnosticUnderlineInfo                  = { fg = p.frog, sp = p.frog },
  DiagnosticUnderlineHint                  = { fg = p.olive, sp = p.olive },

  -- Windows
  WinSeparator                             = { fg = p.starling },
  NormalNC                                 = { bg = p.void },

  -- Floating Windows
  FloatBorder                              = { fg = p.rock, bg = p.background },
  NormalFloat                              = { fg = p.foreground, bg = p.background },
  FloatTitle                               = { fg = p.bee, bg = p.background, bold = true },

  -- Completion
  Pmenu                                    = { fg = p.foreground, bg = p.background },
  PmenuSel                                 = { fg = p.background, bg = p.rock },
  PmenuThumb                               = { bg = p.dark_rock },
  PmenuSbar                                = { bg = p.ivy },

  -- Diff
  DiffAdd                                  = { bg = p.add },
  DiffChange                               = { bg = p.change },
  DiffDelete                               = { bg = p.delete },
  DiffText                                 = { bg = p.untracked },

  -- Gitsigns
  GitSignsAdd                              = { fg = p.add },
  GitSignsChange                           = { fg = p.change },
  GitSignsDelete                           = { fg = p.delete },
  GitSignsUntracked                        = { fg = p.untracked },

  -- LSP
  ["@lsp.mod.abstract"]                    = {},
  ["@lsp.mod.async"]                       = {},
  ["@lsp.mod.declaration"]                 = {},
  ["@lsp.mod.defaultLibrary"]              = {},
  ["@lsp.mod.definition"]                  = {},
  ["@lsp.mod.deprecated"]                  = { strikethrough = true },
  ["@lsp.mod.documentation"]               = { link = "Comment" },
  ["@lsp.mod.modification"]                = {},
  ["@lsp.mod.readonly"]                    = {},
  ["@lsp.mod.static"]                      = {},
  ["@lsp.type.class"]                      = { link = "Type" },
  ["@lsp.type.comment"]                    = { link = "Comment" },
  ["@lsp.type.decorator"]                  = { link = "PreProc" },
  ["@lsp.type.enum"]                       = { link = "Enum" },
  ["@lsp.type.enumMember"]                 = { link = "Constant" },
  ["@lsp.type.event"]                      = {},
  ["@lsp.type.function"]                   = { link = "Function" },
  ["@lsp.type.interface"]                  = { link = "Type" },
  ["@lsp.type.keyword"]                    = { link = "Keyword" },
  ["@lsp.type.macro"]                      = { link = "PreProc" },
  ["@lsp.type.method"]                     = { link = "Function" },
  ["@lsp.type.modifier"]                   = {},
  ["@lsp.type.namespace"]                  = { link = "Constant" },
  ["@lsp.type.number"]                     = { link = "Number" },
  ["@lsp.type.operator"]                   = { link = "Operator" },
  ["@lsp.type.parameter"]                  = { link = "@variable.parameter" },
  ["@lsp.type.property"]                   = { link = "@variable.member" },
  ["@lsp.type.regexp"]                     = { link = "Keyword" },
  ["@lsp.type.string"]                     = { link = "String" },
  ["@lsp.type.struct"]                     = { link = "Type" },
  ["@lsp.type.type"]                       = { link = "Type" },
  ["@lsp.type.typeParameter"]              = { link = "Type" },
  ["@lsp.type.variable"]                   = { link = "@variable" },
  ["@lsp.typemod.function.declaration"]    = {},
  ["@lsp.typemod.function.defaultLibrary"] = {},
  ["@lsp.typemod.method.async"]            = {},
  ["@lsp.typemod.variable.defaultLibrary"] = { link = "Constant" },
  ["@lsp.typemod.variable.readonly"]       = {},
  ["@lsp.typemod.variable.static"]         = {},

  -- LuaLine
  LuaLineDiffAdd                           = { fg = p.add_light },
  LuaLineDiffChange                        = { fg = p.change_light },
  LuaLineDiffDelete                        = { fg = p.delete_light },

  -- Treesitter
  ["@boolean"]                             = { fg = p.butterfly },
  ["@character"]                           = { fg = p.bee },
  ["@comment"]                             = { link = "Comment" },
  ["@comment.documentation"]               = { link = "Comment" },
  ["@constant"]                            = { link = "Constant" },
  ["@constant.builtin"]                    = { link = "Constant" },
  ["@constructor"]                         = { link = "Function" },
  ["@constructor.lua"]                     = { link = "Punctuation" },
  ["@conceal.markdown"]                    = { fg = p.rock },
  ["@conceal.markdown_inline"]             = { fg = p.rock },
  ["@function"]                            = { link = "Function" },
  ["@function.builtin"]                    = { fg = p.water },
  ["@function.macro"]                      = { fg = p.frog },
  ["@keyword"]                             = { link = "Keyword" },
  ["@label"]                               = { fg = p.dirt },
  ["@markup.heading"]                      = { fg = p.sand },
  ["@markup.heading.marker"]               = { fg = p.rock },
  ["@markup.italic"]                       = { italic = true },
  ["@markup.link"]                         = { fg = p.pebble , underline = true },
  ["@markup.link.label"]                   = { fg = p.pebble },
  ["@markup.link.url"]                     = { fg = p.pebble , italic = true },
  ["@markup.list"]                         = { link = "Normal" },
  ["@markup.math"]                         = { fg = p.lavender },
  ["@markup.quote"]                        = { fg = p.rock , italic = true },
  ["@markup.raw"]                          = { fg = p.moss },
  ["@markup.raw.block"]                    = { link = "@markup.raw" },
  ["@markup.strong"]                       = { bold = true },
  ["@markup.strikethrough"]                = { strikethrough = true },
  ["@markup.table"]                        = { link = "Normal" },
  ["@markup.table.separator"]              = { fg = p.rock },
  ["@module"]                              = { link = "Constant" },
  ["@module.builtin.lua"]                  = { link = "Constant" },
  ["@number"]                              = { link = "Number" },
  ["@operator"]                            = { link = "Operator" },
  ["@punctuation"]                         = { link = "Punctuation" },
  ["@punctuation.bracket"]                 = { link = "Punctuation" },
  ["@punctuation.special.markdown"]        = { fg = p.rock },
  ["@special"]                             = { link = "Special" },
  ["@string"]                              = { link = "String" },
  ["@string.documentation"]                = { link = "Comment" },
  ["@type"]                                = { fg = p.raw },
  ["@type.builtin"]                        = { link = "Type" },
  ["@variable"]                            = { link = "Identifier" },
  ["@variable.member"]                     = { fg = p.fern },
  ["@variable.parameter"]                  = { fg = p.leaf },

  -- NvimTree
  NvimTreeNormal                           = { fg = p.foreground, bg = p.background },
  NvimTreeFolderName                       = { fg = p.water },
  NvimTreeFolderIcon                       = { fg = p.water },
  NvimTreeIndentMarker                     = { fg = p.rock },
  NvimTreeGitDirty                         = { fg = p.flower },
  NvimTreeGitNew                           = { fg = p.leaf },
  NvimTreeGitDeleted                       = { fg = p.squirrel },
  NvimTreeOpenedFile                       = { fg = p.olive },
  NvimTreeModifiedFile                     = { fg = p.bee },
  NvimTreeRootFolder                       = { fg = p.sand, bold = true },

  -- nvim-cmp
  CmpGhostText                             = { fg = p.foreground, italic = true },

  -- nvim-cursorword
  CursorWord                               = { underline = true },
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

-- Convert HSV to RGB
local function hsv_rgb(h, s, v)
  local c = s * v
  local x = c * (1 - math.abs((h / 60) % 2 - 1))
  local m = v - c

  local r, g, b = 0, 0, 0

  if h > 0 and h < 60 then
    r, g, b = c, x, 0
  elseif h >= 60 and h < 120 then
    r, g, b = x, c, 0
  elseif h >= 120 and h < 180 then
    r, g, b = 0, c, x
  elseif h >= 180 and h < 240 then
    r, g, b = 0, x, c
  elseif h >= 240 and h < 300 then
    r, g, b = x, 0, c
  elseif h >= 300 and h < 360 then
    r, g, b = c, 0, x
  end

  return (r + m) * 255, (g + m) * 255, (b + m) * 255
end

-- Generate rainbow colors
local function rainbow_palette(color_count, h_range, s_range, v_range)
  local h = h_range[1]
  local s = s_range[1]
  local v = v_range[1]
  local h_step = (h_range[2] - h_range[1]) / color_count
  local s_step = (s_range[2] - s_range[1]) / color_count
  local v_step = (v_range[2] - v_range[1]) / color_count

  local colors = {}
  for i=1, color_count, 1 do
    local r, g, b = hsv_rgb(h, s, v)
    colors[i] = string.format("#%02X%02X%02X", r, g, b)
    h = h + h_step
    s = s + s_step
    v = v + v_step
  end

  return colors
end

-- Colorize local variables
function theme.color_locals(color_count)
  local h_range = {170, 220}
  local s_range = {0.5, 0.7}
  local v_range = {0.4, 0.6}

  for i, color in ipairs(rainbow_palette(color_count, h_range, s_range, v_range)) do
      vim.api.nvim_set_hl(0, "rainbowVariable" .. i, { fg = color })
  end

  local function hash_token(token, buf)
    local line = vim.api.nvim_buf_get_lines(buf, token.line, token.line + 1, true)[1]
    local varname = string.sub(line, token.start_col + 1, token.end_col)
    local ret = 0
    local factor = 27
    for i=1,string.len(varname),1 do
      ret = ((ret * factor) + string.byte(varname,i)) % color_count
    end
    return ret
  end

  vim.api.nvim_create_autocmd("LspTokenUpdate", {
    callback = function(args)
      local token = args.data.token
      local buf = args.buf
      local client_id = args.data.client_id
      if token.type == "variable" and not token.modifiers.defaultLibrary then
        vim.lsp.semantic_tokens.highlight_token(
          token, buf, client_id,
          "rainbowVariable" .. hash_token(token, buf)
        )
      end
    end
  })
end

-- Apply all highlight groups
function theme.load()
  vim.cmd("highlight clear")
  vim.opt.termguicolors = true
  vim.g.colors_name = "mytheme"

  for group, opts in pairs(theme.highlights) do
    if next(opts) then
      vim.api.nvim_set_hl(0, group, opts)
    end
  end
end

return theme
