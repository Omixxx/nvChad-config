---@type MappingsTable
local M = {}

-- keys = {
--   { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
--   { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
--   { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
--   { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
--   { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
-- },

M.general = {
  n = {
    ["s"] = {
      function()
        require("flash").jump {
          remote_op = {
            restore = true,
            motion = nil,
          },
        }
      end,
      desc = "Flash",
    },
    ["<leader>td"] = {
      function()
        require("hex").toggle()
      end,
      "hex dump",
    },
    ["gn"] = {
      function()
        require("trouble").next { skip_groups = true, jump = true }
      end,
    },
    ["<leader>fl"] = {
      function()
        require("telescope").load_extension "flutter"
      end,
      "Flutter tools",
    },
    ["<leader>a"] = { "<cmd>AerialToggle!<CR>", "Aerial" },
    ["<leader>w"] = { ":w<CR>", "save the current file" },
    ["<leader>bc"] = { ":bdelete<CR>", "close the current buffer" },
    ["<leader>m"] = { ":lua require('harpoon.mark').add_file()<CR>", "mark the file" },
    ["<leader>h"] = { ":lua require('harpoon.ui').toggle_quick_menu()<CR>", "harpoon" },
    ["<leader>e"] = { ":NvimTreeToggle<CR>", "Toggle tree view" },
    ["<leader>q"] = { ":q<CR>, close vim" },
    ["<leader>ind"] = { "gg=G<C-o>", "indent the whole file" },
    ["H"] = { ":lua require('harpoon.ui').nav_prev() <CR>", "previous marked file" },
    ["L"] = { ":lua require('harpoon.ui').nav_next() <CR>", "next marked file" },
    ["<C-.>"] = { "<cmd>Oil<CR>", "Open parent directory in a vim buffue" },
    ["gl"] = { "$, go to the end of the line" },
    ["gh"] = { "0w, go to the start of the line" },
    ["vis"] = { "" },
  },
  v = {
    ["gl"] = { "$, go to the end of the line" },
    ["gh"] = { "0w, go to the start of the line" },
    ["tr"] = { "<cmd>Translate EN<CR>" },
  },
  i = {},
}

M.disabled = {
  n = {
    ["<C-i>"] = "",
    ["gi"] = "",
    ["<leader>wk"] = "",
    ["<leader>wK"] = "",
  },
}

M.lspconfig = {
  n = {
    ["<leader>lr"] = {
      function()
        require("telescope.builtin").lsp_references()
      end,
    },
    ["<leader>ld"] = {
      function()
        vim.diagnostic.open_float { border = "rounded" }
      end,
      "Floating diagnostic",
    },
    ["<leader>rn"] = {
      function()
        require("nvchad.renamer").open()
      end,
      "LSP rename",
    },

    ["<leader>la"] = { "<cmd>CodeActionMenu<CR>", "LSP code action" },
    ["gn"] = {
      function()
        vim.diagnostic.goto_next { wrap = true }
      end,
    },
    ["gN"] = {
      function()
        vim.diagnostic.get_prev { wrap = true }
      end,
    },
  },
}

-- more keybinds!

return M
