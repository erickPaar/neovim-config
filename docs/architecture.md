---
title: "Architecture"
description: "Understanding the configuration structure and load order"
category: "core"
related:
  - getting-started.md
  - plugins/README.md
---

# Architecture

## Directory Structure

```
~/.config/nvim/
├── init.lua                 # Entry point
├── lazy-lock.json           # Plugin version lock file
├── lua/
│   ├── config/
│   │   ├── options.lua      # Vim options, leader key
│   │   └── keymaps.lua      # Global keybindings
│   └── plugins/
│       ├── lsp.lua          # Language servers
│       ├── completion.lua   # Autocompletion
│       ├── formatting.lua   # Formatters and linters
│       ├── treesitter.lua   # Syntax highlighting
│       ├── telescope.lua    # Fuzzy finder
│       ├── neo-tree.lua     # File explorer
│       ├── gitsigns.lua     # Git integration
│       ├── dap.lua          # Debugging
│       ├── lualine.lua      # Status line
│       ├── colorscheme.lua  # Theme
│       ├── ui.lua           # UI enhancements
│       ├── which-key.lua    # Keybinding hints
│       ├── alpha.lua        # Dashboard
│       ├── bufferline.lua   # Buffer tabs
│       ├── markview.lua     # Markdown preview
│       ├── csv.lua          # CSV/TSV table view (csvview.nvim)
│       ├── claudecode.lua   # Claude Code integration
│       └── editing.lua      # Editing utilities
└── docs/                    # Documentation
```

## Load Order

The configuration loads in a specific order defined in `init.lua`:

```
1. config/options.lua    ← Leader key MUST be set here
2. lazy.nvim bootstrap   ← Plugin manager initializes
3. plugins/*             ← All plugin specs loaded
4. config/keymaps.lua    ← Global keymaps after plugins
```

### Why This Order Matters

1. **Leader key first** - Must be set before any plugin defines `<leader>` mappings
2. **lazy.nvim bootstrap** - Installs lazy.nvim if missing
3. **Plugin discovery** - `{ import = "plugins" }` loads all files in `lua/plugins/`
4. **Keymaps last** - Ensures plugins are available for keymap definitions

## Plugin System

### lazy.nvim

This configuration uses [lazy.nvim](https://github.com/folke/lazy.nvim) for plugin management.

**Key features:**
- Automatic lazy-loading
- Lockfile for reproducible builds
- Parallel installation
- Plugin specs auto-discovered from `lua/plugins/`

### Plugin Spec Pattern

Each file in `lua/plugins/` returns a table of plugin specifications:

```lua
-- lua/plugins/example.lua
return {
  {
    "author/plugin-name",
    dependencies = { "other/plugin" },
    event = "VeryLazy",        -- Lazy-load trigger
    cmd = "PluginCommand",     -- Or load on command
    keys = {                   -- Or load on keypress
      { "<leader>x", "<cmd>PluginCommand<cr>", desc = "Description" },
    },
    opts = {                   -- Options passed to setup()
      option1 = true,
    },
    config = function()        -- Or custom config function
      require("plugin").setup({})
    end,
  },
}
```

### Lazy-Loading Triggers

| Trigger | Description |
|---------|-------------|
| `event = "VeryLazy"` | Load after UI is ready |
| `event = "BufReadPost"` | Load when opening a file |
| `event = "InsertEnter"` | Load when entering insert mode |
| `cmd = "Command"` | Load when command is run |
| `keys = {...}` | Load when key is pressed |
| `ft = "filetype"` | Load for specific filetypes |

## Configuration Files

### config/options.lua

Sets Vim options and the leader key:

```lua
vim.g.mapleader = " "           -- Space as leader
vim.opt.number = true           -- Line numbers
vim.opt.relativenumber = true   -- Relative numbers
vim.opt.clipboard = "unnamedplus" -- System clipboard
-- ... more options
```

### config/keymaps.lua

Global keybindings not tied to specific plugins:

```lua
local keymap = vim.keymap.set

-- Window navigation
keymap("n", "<C-h>", "<C-w>h")
keymap("n", "<C-j>", "<C-w>j")
-- ... more keymaps
```

## Mason Integration

Mason manages external tools (LSP servers, formatters, linters, debug adapters).

```
Mason
├── LSP Servers (via mason-lspconfig)
│   ├── kotlin_language_server
│   ├── jdtls
│   ├── pyright
│   └── ts_ls
├── Formatters/Linters (via mason-tool-installer)
│   ├── ktlint, google-java-format
│   ├── black, ruff
│   └── prettier, eslint_d
└── Debug Adapters (via mason-nvim-dap)
    ├── java-debug-adapter
    └── java-test
```

## Adding a New Plugin

1. Create a new file in `lua/plugins/`:

```lua
-- lua/plugins/newplugin.lua
return {
  {
    "author/newplugin",
    event = "VeryLazy",
    opts = {},
  },
}
```

2. Restart Neovim or run `:Lazy sync`

## Adding a New Language Server

1. Add to `ensure_installed` in `lua/plugins/lsp.lua`
2. Add setup handler in the `handlers` table
3. Optionally add formatter/linter in `lua/plugins/formatting.lua`

See [LSP Documentation](plugins/lsp.md) for details.

## Related

- [Getting Started](getting-started.md) - Installation guide
- [Plugin Overview](plugins/README.md) - All plugins explained
- [LSP Setup](plugins/lsp.md) - Language server configuration
