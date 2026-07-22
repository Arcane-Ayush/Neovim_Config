return {
  "nvim-treesitter/nvim-treesitter",
  branch = "master",
  build = ":TSUpdate",
  lazy = false,
  opts = {
    ensure_installed = {
      "lua",
      "vim",
      "vimdoc",
      "javascript",
      "typescript",
      "tsx",
      "html",
      "css",
      "markdown",
      "markdown_inline",
      "json",
      "bash",
      "java",
      "c",
      "cpp",
      "python",
      "rust",
      "odin",
      "zig",
      "cmake",
    },
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    indent = {
      enable = false,
    },
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}
