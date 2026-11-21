-- [Plugins]

local plugins = {}

-- bufferline.nvim
plugins["bufferline"] = {{
    { src = "https://github.com/akinsho/bufferline.nvim" }
  },
  function ()
    require("bufferline").setup({})
  end
}

-- cmp
plugins["cmp"] = {{
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
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<Tab>'] = cmp.mapping.select_next_item(),
        ['<S-Tab>'] = cmp.mapping.select_prev_item(),
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp"},
        { name = "buffer"},
      }),
      window = {
        completion = cmp.config.window.bordered({
          winhighlight = "Normal:Pmenu,CursorLine:PmenuSel",
        }),
        documentation = cmp.config.window.bordered({
          winhighlight = "Normal:Pmenu,CursorLine:PmenuSel",
        })
      }
    })
  end
}

-- colorizer
plugins["colorizer"] = {{
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
}

-- diffview
plugins["diffview"] = {{
    { src = "https://github.com/sindrets/diffview.nvim" },
  },
  function ()
    require("diffview").setup({
      enhanced_diff_hl = true
    })
  end
}


-- fzf-lua
plugins["fzf-lua"] = {{
    { src = "https://github.com/junegunn/fzf" },
    { src = "https://github.com/ibhagwan/fzf-lua" }
  },
  function ()
    local ignore_dirs  = {
      ".git",
      "node_modules",
      "bin",
      "build*",
      "lib",
      "dependencies",
      "third_party",
      "thirdParty"
    }

    local ignore_files = {
      "*.exe",
      "*.lib",
      "*.o",
      "*.pdb",
      "*.so"
    }

    local fd_excl, rg_excl = {}, {}
    for _, list in ipairs({ ignore_dirs, ignore_files }) do
      for _, p in ipairs(list) do
        table.insert(fd_excl, ("--exclude %q"):format(p))
        table.insert(rg_excl, ("-g %q"):format("!" .. p))
      end
    end
    fd_excl = table.concat(fd_excl, " ")
    rg_excl = table.concat(rg_excl, " ")

    local fzf_lua = require("fzf-lua")
    fzf_lua.setup({
      files = {
        fd_opts = "--color=never --type f --type l --hidden --follow " .. fd_excl,
        rg_opts = "--color=never --files --hidden --follow " .. rg_excl,
      },
      grep = {
        rg_opts = "--column --line-number --no-heading --color=always "
          .. "--smart-case --max-columns=4096 --hidden " .. rg_excl .. " -e",
      },
    })

    map("n", "<leader>ff", fzf_lua.files)
    map("n", "<leader>fb", fzf_lua.buffers)
    map("n", "<leader>ft", fzf_lua.tabs)
    map("n", "<leader>fs", fzf_lua.grep)
  end
}

-- gitsigns
plugins["gitsigns"] = {{
    { src = "https://github.com/lewis6991/gitsigns.nvim" },
  },
  function ()
    require("gitsigns").setup({})
  end
}

-- ibl
plugins["ibl"] = {{
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
}

-- lualine
plugins["lualine"] = {{
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
}

-- lspsaga
plugins["lspsaga"] = {{
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
}

-- nvim-cursorword
plugins["nvim-cursorword"] = {{
    { src = "https://github.com/xiyaowong/nvim-cursorword" },
  },
  function () end
}

-- nvim-web-devicons
plugins["nvim-web-devicons"] = {{
    { src = "https://github.com/nvim-tree/nvim-web-devicons" },
  },
  function ()
    require("nvim-web-devicons").setup({})
  end
}

-- satellite
plugins["satellite"] = {{
    { src = "https://github.com/lewis6991/satellite.nvim" },
  },
  function ()
    require("satellite").setup({})
  end
}


-- Helper function
local function add_plugins(plugin_list)
  local remotes = {}
  local setups = {}

  for _, plugin in ipairs(plugin_list) do
    if plugin then
      local plug_remotes, plug_setup = plugin[1], plugin[2]

      for _, r in ipairs(plug_remotes) do
        table.insert(remotes, r)
      end

      if plug_setup then
        table.insert(setups, plug_setup)
      end
    end
  end

  vim.pack.add(remotes)

  for _, setup in ipairs(setups) do
    local ok, err = pcall(setup)
    if not ok then
      vim.notify("Plugin setup error: " .. err, vim.log.levels.ERROR)
    end
  end
end

-- Install plugins
add_plugins({
  plugins["bufferline"],
  plugins["cmp"],
  plugins["colorizer"],
  plugins["diffview"],
  plugins["fzf-lua"],
  plugins["gitsigns"],
  plugins["ibl"],
  plugins["lualine"],
  plugins["lspsaga"],
  plugins["nvim-cursorword"],
  plugins["nvim-web-devicons"],
  plugins["satellite"],
})
