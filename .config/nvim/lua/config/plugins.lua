-- [Plugins]

-- Helper function
local function add_plugin(opts, config)
  vim.pack.add(opts)
  if config then
    config()
  end
end

-- bufferline.nvim
add_plugin({
    { src = "https://github.com/akinsho/bufferline.nvim" }
  },
  function ()
    require("bufferline").setup({})
  end
)

-- cmp
add_plugin({
    { src = "https://github.com/hrsh7th/cmp-buffer" },
    { src = "https://github.com/hrsh7th/cmp-nvim-lsp" },
    { src = "https://github.com/hrsh7th/nvim-cmp" },
  },
  function ()
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
  end
)

-- colorizer
add_plugin({
    { src = "https://github.com/catgoose/nvim-colorizer.lua" },
  },
  function ()
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
  end
)

-- fzf-lua
add_plugin({
    { src = "https://github.com/junegunn/fzf" },
    { src = "https://github.com/ibhagwan/fzf-lua" }
  },
  function ()
    local fzf_lua = require("fzf-lua")
    fzf_lua.setup({})

    map("n", "<leader>ff", fzf_lua.files)
    map("n", "<leader>fb", fzf_lua.buffers)
    map("n", "<leader>ft", fzf_lua.tabs)
    map("n", "<leader>fs", fzf_lua.grep)
  end
)

-- gitsigns
add_plugin({
    { src = "https://github.com/lewis6991/gitsigns.nvim" },
  },
  function ()
    require("gitsigns").setup({})
  end
)

-- ibl
add_plugin({
    { src = "https://github.com/lukas-reineke/indent-blankline.nvim" },
  },
  function ()
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
  end
)

-- lspsaga
add_plugin({
    { src = "https://github.com/nvimdev/lspsaga.nvim" },
  },
  function ()
    require("lspsaga").setup({
      outline = {
        layout = "float",
        keys = {
          quit = "q",
          jump = "<CR>",
        },
      },
      ui = {
        code_action = "🛠"
      }
    })
  end
)

-- lualine
add_plugin({
    { src = "https://github.com/nvim-lualine/lualine.nvim" },
  },
  function ()
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
        theme = Theme.lualine,
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
  end
)

-- nvim-treesitter
add_plugin({
    { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
  },
  function ()
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
  end
)

vim.pack.add({
  { src = "https://github.com/xiyaowong/nvim-cursorword" },
  { src = "https://github.com/nvim-zh/colorful-winsep.nvim" },
  { src = "https://github.com/nvim-tree/nvim-web-devicons" },
})
