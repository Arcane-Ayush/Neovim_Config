# Neovim Config

My personal Neovim setup focused on minimalism and fast navigation.It's built on `lazy.nvim` with Treesitter highlighting and NvimTree explorer. 

---

## Requirements

Before installing, make sure you have:
- **Neovim** (v0.10+ recommended)
- **Git**
- **C compiler** (`gcc` or `clang` for Treesitter parser builds)
- **ripgrep** (`rg`) for Telescope live grep
- **Nerd Font** (recommended for file explorer icons)

---

## Installation

### Linux
```bash
# Backup existing config if you have one
mv ~/.config/nvim ~/.config/nvim.bak

# Clone this repo
git clone https://github.com/Arcane-Ayush/Neovim_Config.git ~/.config/nvim

# Launch Neovim (lazy.nvim will auto-install plugins on first run)
nvim
```

### macOS
```bash
# Backup existing config
mv ~/.config/nvim ~/.config/nvim.bak

# Clone this repo
git clone https://github.com/Arcane-Ayush/Neovim_Config.git ~/.config/nvim

# Launch Neovim
nvim
```

### Windows (PowerShell)
```powershell
# Backup existing config
Rename-Item $env:LOCALAPPDATA\nvim $env:LOCALAPPDATA\nvim.bak

# Clone this repo
git clone https://github.com/Arcane-Ayush/Neovim_Config.git $env:LOCALAPPDATA\nvim

# Launch Neovim
nvim
```

---

## Main Keymaps

Leader key is set to **`Space`**.

| Keymap | Mode | Description |
| :--- | :--- | :--- |
| `<leader>e` | Normal | Toggle file explorer sidebar (`nvim-tree`) |
| `<leader>ff` | Normal | Find files in project (`telescope`) |
| `<leader>fg` | Normal | Live grep text across all files in project |
| `<leader>fw` | Normal | Search word under cursor across project |
| `<leader>fb` | Normal | Search open buffers |
| `<Down>` / `<Up>` | Command | Navigate completion popup suggestions |

---

## Themes & Transparency

- Default active theme: `gruvbox-material`
- To switch themes on the fly: Type `:colorscheme ` and hit `<Tab>` to pick from installed themes (`vscode`, `tokyonight`, `catppuccin`, `rose-pine`, `kanagawa`, `everforest`).
- Your selected theme persists automatically across restarts.
- Toggle transparent background across all themes: Edit `local transparent = true/false` at line 1 of `lua/plugins/theme.lua`.

---

## Download Neovim

If you don't have Neovim installed yet, you can download it from the official links:

- Official Releases & Binaries: https://github.com/neovim/neovim/releases
- Install Guide (Linux / macOS / Windows): https://github.com/neovim/neovim/blob/master/BUILD.md
