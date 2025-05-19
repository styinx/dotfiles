local is_windows = vim.loop.os_uname().sysname == "Windows_NT"

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
    ['<C-Space>'] = cmp.mapping.complete(),
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

-- fzf-lua
require("fzf-lua").setup({})

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

require("nvim-treesitter.install").compilers = { "clang" }

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

require("lualine").setup({
  options = {
    icons_enabled = true,
    theme = "vscode",
    component_separators = { left = "", right = ""},
    section_separators = { left = "", right = ""},
    disabled_filetypes = {
      statusline = {},
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
    lualine_b = {"branch", "diff", "diagnostics"},
    lualine_c = {"filename"},
    lualine_x = {"encoding", "fileformat", "filetype"},
    lualine_y = {"progress"},
    lualine_z = {"location"}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {"filename"},
    lualine_x = {"location"},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
})

-- vscode
require("vscode").setup({
  disable_nvimtree_bg = true,
  italic_comments = true,
  underline_links = true,
  terminal_colors = true,
})

-- [opt]
