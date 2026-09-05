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

    -- Neovim 0.12 compatibility fix: unwrap table node captures in query directives.
    -- This mentioned fix is achieved via help of AI for Neovim nightly.
    local orig_get_node_text = vim.treesitter.get_node_text
    vim.treesitter.get_node_text = function(node, source, opts)
      if type(node) == "table" and not node.range then
        node = node[1]
      end
      if not node then return "" end
      return orig_get_node_text(node, source, opts)
    end

    require("nvim-treesitter.configs").setup(opts)
  end,
}
