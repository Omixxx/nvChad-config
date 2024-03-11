local alpha = function()
  return string.format("%x", math.floor(255 * (vim.g.transparency or 0.8)))
end

local change_scale_factor = function(delta)
  vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
end

return setup()
  if vim.g.neovide then
    vim.g.neovide_fullscreen = true
    vim.g.neovide_scale_factor = 0.75
    vim.g.neovide_no_idle = true
    -- g:neovide_transparency should be 0 if you want to unify transparency of content and title bar.
    vim.g.neovide_cursor_vfx_mode = "pixiedust"
    vim.g.neovide_transparency = 0.3
    vim.g.transparency = 0.8
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
end
