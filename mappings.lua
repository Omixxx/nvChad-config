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
    ["s"] = { ":lua Flash()<CR>", desc = "Flash" },
    ["<leader>td"] = { ":lua Hex()<CR>", desc = "hex dump" },
    ["gn"] = { "lua TroubleNext()<CR>", desc = "next error" },
    ["<leader>a"] = { "<cmd>AerialToggle!<CR>", desc = "Aerial" },
    ["<leader>w"] = { ":w<CR>", desc = "save the current file" },
    ["<leader>bc"] = { ":bdelete<CR>", desc = "close the current buffer" },
    ["<leader>m"] = { ":lua require('harpoon.mark').add_file()<CR>", desc = "mark the file" },
    ["<leader>h"] = { ":lua require('harpoon.ui').toggle_quick_menu()<CR>", desc = "harpoon" },
    ["<leader>e"] = { ":NvimTreeToggle<CR>", desc = "Toggle tree view" },
    ["<leader>q"] = { ":q<CR>, close vim" },
    ["<leader>ind"] = { "gg=G<C-o>", desc = "indent the whole file" },
    ["H"] = { ":lua require('harpoon.ui').nav_prev() <CR>", desc = "previous marked file" },
    ["L"] = { ":lua require('harpoon.ui').nav_next() <CR>", desc = "next marked file" },
    ["<C-.>"] = { "<cmd>Oil<CR>", desc = "Open parent directory in a vim buffue" },
    ["gl"] = { "$", desc = "go to the end of the line" },
    ["gh"] = { "0w", desc = "go to the start of the line" },
    ["*"] = { "*``" },
    ["gs"] = { 'maviw"hy:,$s/<C-r>h//g<left><left><left>', desc = "global substitution" },
    ["<leader>fi"] = { "z=1<CR><CR>", desc = "fix the word under the cursor" },
  },
  v = {
    ["gl"] = { "$, go to the end of the line" },
    ["gh"] = { "0w, go to the start of the line" },
    ["tr"] = { "<cmd>Translate EN<CR>" },
    ["<leader>cs"] = { ":Silicon<CR>" },
    ["<leader>fi"] = { ":s/( /(/ge", },
    ["<leader>fp"] = { ":s# \\+# #g<CR><Esc>", },
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
    ["<leader>lr"] = { ":lua LspReference()<cr>", desc = "go to reference" },
    ["<leader>ld"] = { ":lua FloatingDiagnostics()<cr>", desc = "Floating diagnostic" },
    ["<leader>rn"] = { ":lua LspRename()<CR>", desc = "LSP rename" },
    ["<leader>la"] = { "<cmd>CodeActionMenu<CR>", desc = "LSP code action" },
    ["gn"] = { ":lua LspGoToNext()<CR>", desc = "go to next diagnostic" },
    ["gN"] = { ":lua LspGoToPrevious()<CR>", desc = "go to previous diagnostic" },
  },
}

--
-- FUNCTIONS
--

function Flash()
  require("flash").jump {
    remote_op = {
      restore = true,
      motion = nil,
    },
  }
end

function Hex()
  require("hex").toggle()
end

function TroubleNext()
  require("trouble").next { skip_groups = true, jump = true }
end

function LspReference()
  require("telescope.builtin").lsp_references()
end

function FloatingDiagnostics()
  vim.diagnostic.open_float { border = "rounded" }
end

function LspRename()
  require("nvchad.renamer").open()
end

function LspGoToNext()
  vim.diagnostic.goto_next { wrap = true }
end

function LspGoToPrevious()
  vim.diagnostic.get_prev { wrap = true }
end

return M
