---
title: "Plugin Overview"
description: "Overview of all installed plugins"
category: "plugins"
related:
  - ../README.md
  - ../architecture.md
---

# Plugin Overview

This configuration uses [lazy.nvim](https://github.com/folke/lazy.nvim) for plugin management with automatic lazy-loading.

For usage guides, see [Task Guides](../tasks/README.md).

## Plugin Categories

### Core Functionality

| Plugin | Purpose | Configuration |
|--------|---------|---------------|
| nvim-lspconfig | Language Server Protocol | [lsp.md](lsp.md) |
| mason.nvim | LSP/tool installer | [lsp.md](lsp.md) |
| nvim-cmp | Autocompletion | [completion.md](completion.md) |
| nvim-treesitter | Syntax highlighting | [../architecture.md](../architecture.md) |

### Navigation & Search

| Plugin | Purpose | Configuration |
|--------|---------|---------------|
| telescope.nvim | Fuzzy finder | [telescope.md](telescope.md) |
| neo-tree.nvim | File explorer | - |
| bufferline.nvim | Buffer tabs | [ui.md](ui.md) |

### Development Tools

| Plugin | Purpose | Configuration |
|--------|---------|---------------|
| nvim-dap | Debugging | [dap.md](dap.md) |
| conform.nvim | Formatting | [../languages/README.md](../languages/README.md) |
| nvim-lint | Linting | [../languages/README.md](../languages/README.md) |
| gitsigns.nvim | Git integration | [gitsigns.md](gitsigns.md) |

### Editing

| Plugin | Purpose | Usage |
|--------|---------|-------|
| nvim-autopairs | Auto-close brackets | [tasks/editing.md](../tasks/editing.md) |
| Comment.nvim | Toggle comments | [tasks/editing.md](../tasks/editing.md) |
| nvim-surround | Surround text objects | [tasks/editing.md](../tasks/editing.md) |
| vim-illuminate | Highlight references | [tasks/navigation.md](../tasks/navigation.md) |
| markview.nvim | Markdown preview | [markview.md](markview.md) |
| csvview.nvim | CSV/TSV as an aligned table | [../languages/csv.md](../languages/csv.md) |

### AI Agents

| Plugin | Purpose | Configuration |
|--------|---------|---------------|
| claudecode.nvim | Claude Code agent integration | [ai-agents.md](ai-agents.md) |
| opencode.nvim | opencode agent integration | [ai-agents.md](ai-agents.md) |
| snacks.nvim | Terminal/input/picker UI for the agents | [ai-agents.md](ai-agents.md) |

### UI

| Plugin | Purpose | Configuration |
|--------|---------|---------------|
| tokyonight.nvim | Color scheme | [ui.md](ui.md) |
| lualine.nvim | Status line | [ui.md](ui.md) |
| indent-blankline.nvim | Indent guides | [ui.md](ui.md) |
| todo-comments.nvim | TODO highlighting | [ui.md](ui.md) |
| trouble.nvim | Diagnostics list | [ui.md](ui.md) |
| which-key.nvim | Keybinding hints | [ui.md](ui.md) |
| alpha-nvim | Dashboard | [ui.md](ui.md) |

## Plugin Management

### View Installed Plugins

```vim
:Lazy
```

### Update Plugins

```vim
:Lazy update
```

### Sync Plugins (Install/Clean)

```vim
:Lazy sync
```

### Plugin Health Check

```vim
:checkhealth lazy
```

## Adding a New Plugin

Create a new file in `lua/plugins/`:

```lua
-- lua/plugins/myplugin.lua
return {
  {
    "author/plugin-name",
    event = "VeryLazy",
    opts = {
      -- plugin options
    },
  },
}
```

See [Architecture](../architecture.md) for details on plugin specs.

## Related

- [Task Guides](../tasks/README.md) - Usage documentation
- [Architecture](../architecture.md) - Plugin system details
