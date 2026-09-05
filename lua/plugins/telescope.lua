return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  lazy = false,
  config = function()
    local builtin = require("telescope.builtin")

    require("telescope").setup({
      defaults = {
        path_display = { "smart" },
        mappings = {
          i = {
            ["<C-j>"] = "move_selection_next",
            ["<C-k>"] = "move_selection_previous",
          },
        },
      },
    })

    -- Neovim Directory Search Shortcuts:
    -- <leader>ff -> Fuzzy find files by name in current directory
    -- <leader>fg -> Live grep (search keyword across ALL files in directory)
    -- <leader>fw -> Search word under cursor throughout project
    -- <leader>fb -> Find open buffers
    vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find Files in project" })
    vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live Grep text in project" })
    vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "Grep word under cursor" })
    vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find active buffers" })
    vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Find help documentation" })
  end,
}
