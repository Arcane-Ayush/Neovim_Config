-- Theme
vim.opt.termguicolors = true

-- for command-line tab completion settings & popup menu (pum)
vim.opt.wildmode = "longest:full,full"
vim.opt.wildoptions = "pum"

-- Arrow keys navigation for command-line suggestions (wildmenu popup)
vim.keymap.set("c", "<Down>", function()
  return vim.fn.wildmenumode() == 1 and "<C-n>" or "<Down>"
end, { expr = true, desc = "Navigate wildmenu down" })

vim.keymap.set("c", "<Up>", function()
  return vim.fn.wildmenumode() == 1 and "<C-p>" or "<Up>"
end, { expr = true, desc = "Navigate wildmenu up" })

vim.keymap.set("c", "<Right>", function()
  return vim.fn.wildmenumode() == 1 and "<C-n>" or "<Right>"
end, { expr = true, desc = "Navigate wildmenu next" })

vim.keymap.set("c", "<Left>", function()
  return vim.fn.wildmenumode() == 1 and "<C-p>" or "<Left>"
end, { expr = true, desc = "Navigate wildmenu prev" })



-- Adding Leader key
vim.g.mapleader = " "


-- Enable clipboard support
vim.opt.clipboard = "unnamedplus"

--Setting up clipboard provider to wl-clipboard or other providers.
--Removed the wl-copy , will add a ladder.

-- Normal mode mappings
vim.api.nvim_set_keymap("n", "y", '"+y', { noremap = true })
vim.api.nvim_set_keymap("n", "yy", '"+yy', { noremap = true })
vim.api.nvim_set_keymap("n", "Y", '"+yy', { noremap = true })

-- Few more
vim.keymap.set('n', 'j', 'gj', { noremap = true, silent = true })
vim.keymap.set('n', 'k', 'gk', { noremap = true, silent = true })

-- Visual mode mappings
vim.api.nvim_set_keymap("x", "y", '"+y', { noremap = true })
vim.api.nvim_set_keymap("x", "Y", '"+y', { noremap = true })

-- Disable inlay hints ( from the lazy vim configuration)
vim.lsp.inlay_hint.enable(false)


-- Indentation

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "javascript",
    "typescript",
    "javascriptreact",
    "typescriptreact",
    "html",
    "css",
  },
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.softtabstop = 2
  end,
})

-- relative number
vim.opt.number = true
vim.opt.relativenumber = true

-- lazy.nvim

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")


-----------------------------------------------------------------------------
-- Legacy Netrw Explorer (just disabled in favor of lua/plugins/explorer.lua)

-- vim.g.netrw_banner = 0
-- vim.g.netrw_liststyle = 3
-- vim.g.netrw_winsize = 25
-- local function toggle_explorer()
--   for _, win in ipairs(vim.api.nvim_list_wins()) do
--     local buf = vim.api.nvim_win_get_buf(win)
--     if vim.bo[buf].filetype == "netrw" then
--       vim.api.nvim_win_close(win, true)
--       return
--     end
--   end
--   vim.cmd("Lex")
--   vim.api.nvim_win_set_width(0, 30)
-- end
-- vim.keymap.set("n", "<leader>e", toggle_explorer, { desc = "Toggle Explorer" })

