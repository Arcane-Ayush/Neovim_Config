-- Transparency TOGGLE:
-- Set to true to make ALL installed & built-in themes 100% transparent
-- Set to false to give ALL themes their default solid backgrounds
local transparent = true

-- Persistent Theme Helper Functions
local theme_file = vim.fn.stdpath("state") .. "/active_theme.txt"

local function get_saved_theme()
  local f = io.open(theme_file, "r")
  if f then
    local theme = f:read("*l")
    f:close()
    if theme and theme ~= "" then
      return theme
    end
  end
  return "gruvbox-material"
end

local function save_theme(theme_name)
  if theme_name and theme_name ~= "" then
    local f = io.open(theme_file, "w")
    if f then
      f:write(theme_name .. "\n")
      f:close()
    end
  end
end

-- Automatically save active theme whenever colorscheme changes
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    if vim.g.colors_name then
      save_theme(vim.g.colors_name)
    end
  end,
})

return {
  -- 0. Universal Transparency Plugin (Handles all themes + indent-blankline cleanly)
  {
    "xiyaowong/transparent.nvim",
    lazy = false,
    opts = {
      extra_groups = {
        "NvimTreeNormal",
        "NvimTreeNormalNC",
        "NvimTreeWinSeparator",
        "NormalFloat",
        "FloatBorder",
      },
    },
    config = function(_, opts)
      local transparent_plugin = require("transparent")
      transparent_plugin.setup(opts)
      transparent_plugin.clear_prefix("NvimTree")
      if transparent then
        vim.cmd("TransparentEnable")
      else
        vim.cmd("TransparentDisable")
      end
    end,
  },

  -- 1. Gruvbox Material & Saved Theme Restorer
  {
    "sainnhe/gruvbox-material",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.gruvbox_material_background = "hard" -- "hard", "medium", "soft"
      vim.g.gruvbox_material_foreground = "material" -- "material", "mix", "original"
      vim.g.gruvbox_material_enable_italic = 1
      vim.g.gruvbox_material_enable_bold = 1
      vim.g.gruvbox_material_better_performance = 1
      vim.g.gruvbox_material_transparent_background = transparent and 1 or 0

      -- Automatically restore saved theme from previous session (defaults to gruvbox-material)
      local active_theme = get_saved_theme()
      pcall(vim.cmd.colorscheme, active_theme)
    end,
  },

  -- 2. VS Code Dark
  {
    "Mofiqul/vscode.nvim",
    lazy = false,
    opts = {
      style = "dark",
      transparent = transparent,
      italic_comments = true,
      underline_links = true,
    },
  },

  -- 3. Tokyonight (Vibrant Blue/Purple theme with rich italics)
  {
    "folke/tokyonight.nvim",
    lazy = false,
    opts = {
      style = "night", -- "storm", "moon", "night", "day"
      transparent = transparent,
      styles = {
        comments = { italic = true },
        keywords = { italic = true },
        functions = { italic = true },
        variables = {},
      },
    },
  },

  -- 4. Catppuccin (Smooth Pastel theme with full italics support)
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    opts = {
      flavour = "mocha", -- "mocha", "macchiato", "frappe", "latte"
      transparent_background = transparent,
      styles = {
        comments = { "italic" },
        conditionals = { "italic" },
        loops = { "italic" },
        functions = { "italic" },
        keywords = { "italic" },
        types = { "italic" },
      },
    },
  },

  -- 5. Rose Pine (Warm, elegant aesthetic with gold, pine, and iris accents)
  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false,
    opts = {
      variant = "main", -- "main", "moon", "dawn"
      styles = {
        bold = true,
        italic = true,
        transparency = transparent,
      },
    },
  },

  -- 6. Kanagawa (Japanese art inspired warm dark theme)
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    opts = {
      commentStyle = { italic = true },
      functionStyle = { italic = true },
      keywordStyle = { italic = true },
      statementStyle = { italic = true },
      typeStyle = { italic = true },
      transparent = transparent,
      theme = "wave", -- "wave", "dragon", "lotus"
    },
  },

  -- 7. Everforest (Comfortable, natural dark green aesthetic)
  {
    "sainnhe/everforest",
    lazy = false,
    config = function()
      vim.g.everforest_background = "hard"
      vim.g.everforest_enable_italic = 1
      vim.g.everforest_better_performance = 1
      vim.g.everforest_transparent_background = transparent and 1 or 0
    end,
  },
}
