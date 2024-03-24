-- local autocmd = vim.api.nvim_create_auocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
--
--
--
--

-- snipmate folder
vim.g.snipmate_snippets_path = vim.fn.stdpath "config" .. "/lua/custom/snippets/snipmate"

-- vim.o.guifont = "JetBrainsMonoNL"
vim.cmd ": set relativenumber"
vim.cmd ": set scrolloff=5"

--set status line
vim.cmd ": set laststatus=3"
vim.cmd "set cmdheight=0"

-- flash configuration
vim.keymap.set("n", "s", function()
  local current_window = vim.fn.win_getid()
  require("leap").leap { target_windows = { current_window } }
end)

-- neovide configuration
local alpha = function()
  return string.format("%x", math.floor(255 * (vim.g.transparency or 0.8)))
end

local change_scale_factor = function(delta)
  vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
end

if vim.g.neovide then
  vim.keymap.set("i", "<C-backspace>", "<C-w>")
  vim.o.guifont = "JetBrains:h14" -- text below applies for VimScript
  vim.g.neovide_scale_factor = 0.75
  vim.g.neovide_no_idle = true
  -- g:neovide_transparency should be 0 if you want to unify transparency of content and title bar.
  vim.g.neovide_cursor_vfx_mode = "pixiedust"
  vim.g.neovide_transparency = 0.3
  vim.g.transparency = 0.7
  vim.g.neovide_background_color = "#0f1117" .. alpha()
  vim.keymap.set("n", "<C-+>", function()
    change_scale_factor(1.25)
  end)
  vim.keymap.set("n", "<C-->", function()
    change_scale_factor(1 / 1.25)
  end)
  vim.g.neovide_remember_window_size = true
  change_scale_factor(1.25)
  change_scale_factor(1 / 1.25)
end

-- setup spellceck
vim.opt.spelllang = { "en_us", "it" }
vim.opt.spell = true

-- setup firenvim
if vim.g.started_by_firenvim == true then
  vim.o.laststatus = 0
else
  vim.o.laststatus = 2
end
