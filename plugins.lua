local overrides = require "custom.configs.overrides"
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options
  --
  --
  --
  --
  --
  --
  --
  --
  --
  --
  {
    "stevearc/oil.nvim",
    opts = {},
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = "Oil",
    confg = function()
      require("oil").setup {
        -- your configuration comes here
      }
    end,
  },
  {
    "Myzel394/easytables.nvim",
    config = function(_, opts)
      require("easytables").setup {}
    end,
    cmd = {
      "EasyTablesCreateNew",
      "ExportTable",
      "InsertColumnLeft",
      "InsertColumnRight",
      "InsertRowAbove",
      "InsertRowBelow",
      "DeleteColumn",
      "DeleteRow",
      "MoveColumnLeft",
      "MoveColumnRight",
      "MoveRowUp",
      "MoveRowDown",
    },
  },
  {
    "uga-rosa/translate.nvim",
    cmd = "Translate",
    config = function()
      require("translate").setup {
        default = {
          command = "google",
          -- you can also use floating to avoid
          -- replacing text
          output = "replace",
          parse_after = "head",
        },
      }
    end,
  },
  {
    "rebelot/kanagawa.nvim",
  },
  {
    "nvim-treesitter/playground",
    cmd = "TSPlaygroundToggle",
  },

  {
    "weilbith/nvim-code-action-menu",
    cmd = "CodeActionMenu",
  },

  {
    "stevearc/aerial.nvim",
    -- Optional dependencies

    opts = {
      icons = {},
      highlight_on_hover = true,
      nerd_font = "auto",
      layout = {
        -- These control the width of the aerial window.
        -- They can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
        -- min_width and max_width can be a list of mixed types.
        -- max_width = {40, 0.2} means "the lesser of 40 columns or 20% of total"
        --
        max_width = { 100 },

        -- key-value pairs of window-local options for aerial window (e.g. winhl)
        win_opts = {},

        -- Determines the default direction to open the aerial window. The 'prefer'
        -- options will open the window in the other direction *if* there is a
        -- different buffer in the way of the preferred direction
        -- Enum: prefer_right, prefer_left, right, left, float
        default_direction = "right",

        -- Determines where the aerial window will be opened
        --   edge   - open aerial at the far right/left of the editor
        --   window - open aerial to the right/left of the current window
        placement = "window",

        -- When the symbols change, resize the aerial window (within min/max constraints) to fit
        resize_to_content = false,

        -- Preserve window size equality with (:help CTRL-W_=)
        preserve_equality = true,
      },
    },
    lazy = false,
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "nvimtools/none-ls.nvim",
        event = "VeryLazy",
        opts = function()
          return require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },
  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = {
      overrides.mason,
      ensure_installed = {
        "marksman",
        "dockerfile-language-server",
        "xmlformatter",
        "black",
        "mypy",
        "ruff",
        "pyright",
        "jdtls",
        "rust-analyzer",
        "terraform-ls",
        "stylua",
        "docker-compose-language-service",
        "checkstyle",
        "svelte-language-server",
        "tailwindcss-language-server",
        "prettier",
        "gopls",
      },
    },
    automatic_installation = true,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {
      incremental = false,

      rainbow = {
        enabled = true,
        -- number between 1 and 9
        shade = 1,
      },
      modes = {
        -- options used when flash is activated through
        -- a regular search with `/` or `?`
        search = {
          -- when `true`, flash will be activated during regular search by default.
          -- You can always toggle when searching with `require("flash").toggle()`
          enabled = true,
          highlight = { backdrop = false },
          jump = { history = true, register = true, nohlsearch = true },
          search = {
            -- `forward` will be automatically set to the search direction
            -- `mode` is always set to `search`
            -- `incremental` is set to `true` when `incsearch` is enabled
          },
        },
      },
    },
    -- stylua: ignore
  },
  {
    {
      "kylechui/nvim-surround",
      version = "*", -- Use for stability; omit to use `main` branch for the latest features
      event = "VeryLazy",
      config = function()
        require("nvim-surround").setup {
          -- Configuration here, or leave empty to use defaults
        }
      end,
    },
  },
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
    end,
  },
  {
    "ThePrimeagen/harpoon",
    lazy = false,
    init = function()
      require("harpoon").setup {
        global_settings = {
          -- sets the marks upon calling `toggle` on the ui, instead of require `:w`.
          save_on_toggle = false,

          -- saves the harpoon file upon every change. disabling is unrecommended.
          save_on_change = true,

          -- sets harpoon to run the command immediately as it's passed to the terminal when calling `sendCommand`.
          enter_on_sendcmd = false,

          -- closes any tmux windows harpoon that harpoon creates when you close Neovim.
          tmux_autoclose_windows = false,

          -- filetypes that you want to prevent from adding to the harpoon list menu.
          excluded_filetypes = { "harpoon" },

          -- set marks specific to each git branch inside git repository
          mark_branch = false,

          -- enable tabline with harpoon marks
          tabline = false,
          tabline_prefix = "   ",
          tabline_suffix = "   ",
        },
      }
    end,
  },
  {
    "glepnir/dashboard-nvim",
    event = "VimEnter",
    config = function()
      require("dashboard").setup {
        theme = "doom",
        config = {
          disable_move = false,
          header = {
            "                                   ",
            "                                   ",
            "                                   ",
            "                                   ",
            "                                   ",
            "                                   ",
            "                                   ",
            "                                   ",
            "                                   ",
            "   ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣭⣿⣶⣿⣦⣼⣆         ",
            "    ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦       ",
            "          ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷⠄⠄⠄⠄⠻⠿⢿⣿⣧⣄     ",
            "           ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄    ",
            "          ⢠⣿⣿⣿⠈  ⠡⠌⣻⣿⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀  ",
            "   ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘⠄ ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄  ",
            "  ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄   ",
            " ⣠⣿⠿⠛⠄⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄  ",
            " ⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇⠄⠛⠻⢷⣄ ",
            "      ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆     ",
            "       ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃     ",
            "     ⢰⣶  ⣶ ⢶⣆⢀⣶⠂⣶⡶⠶⣦⡄⢰⣶⠶⢶⣦  ⣴⣶     ",
            "     ⢸⣿⠶⠶⣿ ⠈⢻⣿⠁ ⣿⡇ ⢸⣿⢸⣿⢶⣾⠏ ⣸⣟⣹⣧    ",
            "     ⠸⠿  ⠿  ⠸⠿  ⠿⠷⠶⠿⠃⠸⠿⠄⠙⠷⠤⠿⠉⠉⠿⠆   ",
            "                                   ",
            "                                   ",
            "                                   ",
          },
          center = {
            {
              icon = "",
              icon_hl = "group",
              desc = "",
              desc_hl = "group",
              -- key = 'shortcut key in dashboard buffer',
              key_hl = "group",
              action = "",
            },
          },
          footer = {}, --your footer
        },
      }
    end,
    dependencies = { { "nvim-tree/nvim-web-devicons" } },
  },
  {
    "glacambre/firenvim",

    -- Lazy load firenvim
    -- Explanation: https://github.com/folke/lazy.nvim/discussions/463#discussioncomment-4819297
    lazy = not vim.g.started_by_firenvim,
    build = function()
      vim.fn["firenvim#install"](0)
    end,
  },
  {
    "zbirenbaum/copilot.lua",
    -- Lazy load when event occurs. Events are triggered
    -- as mhntioned in:
    -- https://vi.stackexchange.com/a/4495/20389
    event = "InsertEnter",
    -- You can also have it load at immediately at
    -- startup by commenting above and uncommenting below:status
    lazy = false,
    opts = overrides.copilot,
    filetypes = {
      markdown = true,
      ["*"] = true,
    },
    config = function()
      require("copilot").setup {
        suggestion = {
          auto_trigger = true,
          keymap = {
            -- l'ho messo freccia destra perche in wezterm ho mappato ctra+a con freccia destra in modo che posso
            -- completare con ctrl+a sia in visia in vim che nella shell fish
            accept = "<Right>",
            next = "<C-l>",
            prev = "<C-h>",
            dismiss = "<C-x>",
          },
        },
      }
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    lazy = true,
    config = function()
      require("nvim-treesitter.configs").setup {
        textobjects = {
          select = {
            enable = true,
            lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
            keymaps = {
              ["va="] = { query = "@assignment.outer", desc = "Select outer part of an assignment" },
              ["i="] = { query = "@assignment.inner", desc = "Select inner part of an assignment" },
              ["l="] = { query = "@assignment.lhs", desc = "Select left hand side of an assignment" },
              ["r="] = { query = "@assignment.rhs", desc = "Select right hand side of an assignment" },
              -- You can use the capture groups defined in textobjects.scm
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["ac"] = "@class.outer",
              ["ic"] = "@class.inner",

              -- Or you can define your own textobjects like this
              ["iF"] = {
                python = "(function_definition) @function",
                cpp = "(function_definition) @function",
                c = "(function_definition) @function",
                java = "(method_declaration) @function",
              },
            },
          },
          swap = {
            enable = true,
            swap_next = {
              ["<leader>a"] = "@parameter.inner",
            },
            swap_previous = {
              ["<leader>A"] = "@parameter.inner",
            },
          },
          move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
              ["]]"] = "@function.outer",
              ["]c"] = "@class.outer",
            },
            goto_next_end = {
              ["[["] = "@function.outer",
              ["]C"] = "@class.outer",
            },
            goto_previous_start = {
              ["<C-]>"] = "@function.outer",
              ["[c"] = "@class.outer",
            },
            goto_previous_end = {
              ["[]"] = "@function.outer",
              ["[C"] = "@class.outer",
            },
          },
        },
      }
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
  {
    "RaafatTurki/hex.nvim",
    config = function()
      require("hex").setup()
    end,
  },

  -- themes
  {
    "santos-gabriel-dario/darcula-solid.nvim",
    lazy = false,
    dependencies = { "rktjmp/lush.nvim" },
  },

  --
  -- tru balance
  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
}

return plugins
