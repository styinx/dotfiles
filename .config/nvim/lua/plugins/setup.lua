local is_windows = vim.loop.os_uname().sysname == "Windows_NT"
local theme = require("theme")

-- [start]

-- bufferline
require("bufferline").setup({})

-- nvim-cmp
local cmp = require("cmp")
cmp.setup({
  experimental = {
    ghost_text = {
      hl_group = "CmpGhostText"
    },
    native_menu = false
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-Space>'] =  cmp.mapping.complete(), -- Keycode not recognized
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp"},
    { name = "buffer"},
  }),
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered()
  }
})

-- colorful-winsep
require("colorful-winsep").setup({
  hi = {
    fg = theme.palette.pebble,
    bg = "NONE"
  },
  smooth = false
})

-- fzf-lua
require("fzf-lua").setup({})

-- gitsigns
require("gitsigns").setup({})

-- ibl
require("ibl").setup({
  indent = {
    char = "┊",
  },
  whitespace = {
    remove_blankline_trail = false,
  },
  scope = {
    enabled = true,
    show_start = false,
    show_end = false,
    highlight = { "Operator" }
  },
})

-- lspsaga
require("lspsaga").setup({})

-- lualine
local ll_diagnostics = {
  "diagnostics",
  diagnostics_color = {
      error = "DiagnosticError",
      warn  = "DiagnosticWarn",
      info  = "DiagnosticInfo",
      hint  = "DiagnosticHint",
    },
}

local ll_diff = {
  "diff",
  colored = true,
  diff_color = {
    added    = "LuaLineDiffAdd",
    modified = "LuaLineDiffChange",
    removed  = "LuaLineDiffDelete",
  },
}

require("lualine").setup({
  options = {
    icons_enabled = true,
    theme = theme.lualine,
    component_separators = { left = "", right = ""},
    section_separators = { left = "", right = ""},
    disabled_filetypes = {
      statusline = { "NvimTree" },
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    always_show_tabline = true,
    globalstatus = false,
    refresh = {
      statusline = 100,
      tabline = 100,
      winbar = 100,
    }
  },
  sections = {
    lualine_a = {"mode"},
    lualine_b = {"branch", ll_diff, ll_diagnostics, "lsp_status"},
    lualine_c = {"filename"},
    lualine_x = {"encoding", "fileformat", "filetype"},
    lualine_y = {"progress"},
    lualine_z = {"location"}
  },
  inactive_sections = {
    lualine_a = {"filename"},
    lualine_b = {"diagnostics"},
    lualine_c = {},
    lualine_x = {"filetype"},
    lualine_y = {"progress"},
    lualine_z = {"location"}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
})

-- nvim-colorizer
require("colorizer").setup({
  filetypes = {
    "css",
    "html",
    lua = {
      names = false
    },
  },
  user_default_options = {
    mode = "virtualtext",
    rgb_fn = true
  }
})

-- nvim-tree
require("nvim-tree").setup()

-- nvim-treesitter.install-
require("nvim-treesitter.install").compilers = { "clang" }

-- nvim-treesitter.configs-
require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "asm",
    "c",
    "cpp",
    "css",
    "html",
    "javascript",
    "lua",
    "markdown",
    "python",
    "vim",
    "vimdoc",
    "xml",
  },
  sync_install = true,
  auto_install = true,
  ignore_install = {},

  autopairs = {
    enable = true
  },

  highlight = {
    enable = true
  },

  indent = {
    enable = true
  },

})

--[[
-- vscode
require("vscode").setup({
  disable_nvimtree_bg = true,
  italic_comments = true,
  underline_links = true,
  terminal_colors = true,
})
]]--

-- [opt]
