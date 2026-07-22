return {
  "Mofiqul/vscode.nvim",
  priority = 1000,
  config = function()
    require("vscode").setup({
      style = "dark",
      transparent = false,
      italic_comments = true,
      underline_links = true,
      disable_nth_background = false,
    })
    vim.cmd.colorscheme("vscode")
  end,
}
