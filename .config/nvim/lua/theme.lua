local theme = {}

local p = {
  background      = "#0C0C0C",
  foreground      = "#a8a8a8",

  add             = "#104010",
  add_light       = "#207020",
  change          = "#807020",
  change_light    = "#a09000",
  delete          = "#703030",
  delete_light    = "#a03000",
  untracked       = "#404040",
  untracked_light = "#808080",

  error           = "#703030",
  error_light     = "#a03000",
  hint            = "#808080",
  hint_light      = "#a0a0a0",
  info            = "#106070",
  info_light      = "#207080",
  ok              = "#104010",
  ok_light        = "#207020",
  warning         = "#a07000",
  warning_light   = "#c09000",

  bark            = "#845444",
  bee             = "#b8a858",
  beetle          = "#202020",
  clay            = "#886450",
  butterfly       = "#ae7e2e",
  dark_leaf       = "#232b1f",
  dark_rock       = "#555555",
  dirt            = "#706020",
  fern            = "#909060",
  flower          = "#d58a4e",
  frog            = "#3f8f9f",
  grape           = "#6f506a",
  grass           = "#589458",
  ivy             = "#407840",
  lavender        = "#706090",
  leaf            = "#689428",
  lemon           = "#989848",
  moss            = "#649d54",
  mushroom        = "#b84848",
  olive           = "#b2b790",
  rock            = "#606060",
  sand            = "#906840",
  starling        = "#1a1a1a",
  pebble          = "#507080",
  squirrel        = "#946060",
  void            = "#101010",
  water           = "#3d7d8d",
}

local highlights = {
  -- Command line
  ErrorMsg                                 = { fg = p.error_light },
  ModeMsg                                  = { fg = p.info_light },
  Question                                 = { fg = p.ok_light },
  WarningMsg                               = { fg = p.warning_light },

  -- List Symbols
  SpecialKey                               = { fg = p.dark_rock },
  NonText                                  = { fg = p.dark_rock },
  Whitespace                               = { fg = p.dark_rock },

  -- Syntax
  Normal                                   = { fg = p.foreground, bg = p.background },
  Comment                                  = { fg = p.dark_rock, italic = true },
  Constant                                 = { fg = p.water },
  Enum                                     = { fg = p.bee },
  Function                                 = { fg = p.ivy },
  Identifier                               = { fg = p.pebble },
  Keyword                                  = { fg = p.sand },
  Number                                   = { fg = p.squirrel },
  Operator                                 = { fg = p.clay },
  PreProc                                  = { fg = p.sand },
  Punctuation                              = { fg = p.grape },
  Special                                  = { fg = p.butterfly },
  Statement                                = { fg = p.sand },
  String                                   = { fg = p.lemon },
  Structure                                = { fg = p.bee },
  Title                                    = { fg = p.moss },
  Type                                     = { fg = p.leaf },

  -- Search
  CurSearch                                = { fg = p.starling, bg = p.fern },
  IncSearch                                = { fg = p.starling, bg = p.rock },
  MatchParen                               = { bg = p.fern },
  Search                                   = { fg = p.starling, bg = p.rock },
  Substitute                               = { fg = p.starling, bg = p.rock },

  -- Spelling
  SpellBad                                 = { sp = p.sand, undercurl = true },
  SpellCap                                 = { sp = p.fern, undercurl = true },
  SpellLocal                               = { sp = p.pebble, undercurl = true },
  SpellRare                                = { sp = p.lavender, undercurl = true },

  -- UI
  Cursor                                   = { bg = p.foreground },
  CursorLine                               = { bg = p.starling },
  CursorLineNr                             = { fg = p.foreground },
  Directory                                = { fg = p.leaf },
  FoldColumn                               = { bg = p.starling },
  LineNr                                   = { fg = p.rock },
  SignColumn                               = { fg = p.starling },
  StatusLine                               = { fg = p.foreground },
  StatusLineNC                             = { fg = p.rock, bg = p.starling, italic = true },
  QuickFixLine                             = { bg = p.fern },
  Visual                                   = { fg = p.foreground, bg = p.dark_leaf },

  -- Windows
  NormalNC                                 = { bg = p.void },
  TabLine                                  = { fg = p.foreground },
  TabLineSel                               = { fg = p.pebble, bg = p.pebble },
  TabLineFill                              = { fg = p.foreground },
  WinBar                                   = { fg = p.rock },
  WinBarNC                                 = { fg = p.rock },
  WinSeparator                             = { fg = p.starling },

  -- Windows (floating)
  FloatBorder                              = { fg = p.dark_rock, bg = p.beetle },
  NormalFloat                              = { fg = p.foreground, bg = p.beetle },
  FloatTitle                               = { fg = p.bee, bg = p.beetle, bold = true },

  -- Completion
  Pmenu                                    = { fg = p.foreground, bg = p.starling },
  PmenuSel                                 = { fg = p.background, bg = p.dark_rock },
  PmenuThumb                               = { bg = p.dark_rock },
  PmenuSbar                                = { bg = p.ivy },

  -- Diagnostics
  DiagnosticError                          = { fg = p.error },
  DiagnosticHint                           = { fg = p.hint },
  DiagnosticInfo                           = { fg = p.info },
  DiagnosticOk                             = { fg = p.ok },
  DiagnosticWarn                           = { fg = p.warning },
  DiagnosticDeprecated                     = { link = "DiagnosticHint" },
  DiagnosticFloatingError                  = { fg = p.error_light },
  DiagnosticFloatingHint                   = { fg = p.hint_light },
  DiagnosticFloatingInfo                   = { fg = p.info_light },
  DiagnosticFloatingWarn                   = { fg = p.warning_light },
  DiagnosticSignError                      = { fg = p.error_light },
  DiagnosticSignHint                       = { fg = p.hint_light },
  DiagnosticSignInfo                       = { fg = p.info_light },
  DiagnosticSignWarn                       = { fg = p.warning_light },
  DiagnosticVirtualTextError               = { fg = p.error },
  DiagnosticVirtualTextHint                = { fg = p.hint },
  DiagnosticVirtualTextInfo                = { fg = p.info },
  DiagnosticVirtualTextWarn                = { fg = p.warning },
  DiagnosticVirtualLinesError              = { fg = p.error },
  DiagnosticVirtualLinesHint               = { fg = p.hint },
  DiagnosticVirtualLinesInfo               = { fg = p.info },
  DiagnosticVirtualLinesWarn               = { fg = p.warning },
  DiagnosticUnderlineError                 = { fg = p.error, sp = p.error },
  DiagnosticUnderlineHint                  = { fg = p.hint, sp = p.hint },
  DiagnosticUnderlineInfo                  = { fg = p.info, sp = p.info },
  DiagnosticUnderlineWarn                  = { fg = p.warning, sp = p.warning },
  DiagnosticUnnecessary                    = { link = "DiagnosticHint" },

  -- Diff
  DiffAdd                                  = { bg = p.add_light },
  DiffChange                               = { bg = p.change_light },
  DiffDelete                               = { bg = p.delete_light },
  DiffText                                 = { bg = p.untracked_light },

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
  ["@comment.error"]                       = { fg = p.squirrel, bold = true },
  ["@comment.note"]                        = { fg = p.water, bold = true },
  ["@comment.todo"]                        = { fg = p.bee, bold = true },
  ["@comment.warning"]                     = { fg = p.flower, bold = true },
  ["@constant"]                            = { link = "Constant" },
  ["@constant.builtin"]                    = { fg = p.frog },
  ["@constant.macro"]                      = { link = "Constant" },
  ["@constructor"]                         = { link = "Function" },
  ["@constructor.lua"]                     = { link = "Punctuation" },
  ["@conceal.markdown"]                    = { fg = p.rock },
  ["@conceal.markdown_inline"]             = { fg = p.rock },
  ["@enum"]                                = { link = "Enum" },
  ["@function"]                            = { link = "Function" },
  ["@function.builtin"]                    = { fg = p.leaf },
  ["@function.call"]                       = { link = "@function" },
  ["@function.macro"]                      = { fg = p.frog },
  ["@function.method"]                     = { fg = p.fern },
  ["@function.method.call"]                = { link = "@function.method" },
  ["@keyword"]                             = { link = "Keyword" },
  ["@keyword.conditional"]                 = { link = "Keyword" },
  ["@keyword.conditional.ternary"]         = { link = "Keyword" },
  ["@keyword.coroutine"]                   = { link = "Keyword" },
  ["@keyword.debug"]                       = { link = "Keyword" },
  ["@keyword.function"]                    = { link = "Keyword" },
  ["@keyword.import"]                      = { link = "Keyword" },
  ["@keyword.operator"]                    = { link = "Keyword" },
  ["@keyword.modifier"]                    = { link = "Keyword" },
  ["@keyword.repeat"]                      = { link = "Keyword" },
  ["@keyword.return"]                      = { link = "Keyword" },
  ["@keyword.type"]                        = { link = "Keyword" },
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
  ["@module"]                              = { link = "@constant" },
  ["@module.builtin"]                      = { link = "@constant.builtin" },
  ["@module.builtin.lua"]                  = { link = "@constant.builtin" },
  ["@number"]                              = { link = "Number" },
  ["@operator"]                            = { link = "Operator" },
  ["@property"]                            = { link = "@variable.member" },
  ["@punctuation"]                         = { link = "Punctuation" },
  ["@punctuation.bracket"]                 = { link = "Punctuation" },
  ["@punctuation.special.markdown"]        = { fg = p.rock },
  ["@special"]                             = { link = "Special" },
  ["@string"]                              = { link = "String" },
  ["@string.documentation"]                = { link = "Comment" },
  ["@string.escape"]                       = { link = "Special" },
  ["@structure"]                           = { link = "Structure" },
  ["@tag"]                                 = { fg = p.sand },
  ["@tag.attribute"]                       = { fg = p.clay },
  ["@tag.delimiter"]                       = { link = "Punctuation" },
  ["@type"]                                = { link = "Type" },
  ["@type.builtin"]                        = { fg = p.grass },
  ["@variable"]                            = { link = "Identifier" },
  ["@variable.builtin"]                    = { fg = p.bee },
  ["@variable.member"]                     = { fg = p.fern },
  ["@variable.parameter"]                  = { fg = p.fern },

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
