---
title: "Neovim Configuration"
description: "A modular Neovim configuration for multi-language development"
category: "core"
---

# Neovim Configuration

A modular Neovim configuration for **Kotlin**, **Java**, **Python**, **JavaScript**, and **TypeScript** development.

## What do you want to do?

| Task | Guide |
|------|-------|
| Move between windows, buffers, jump to definitions | [Navigation](tasks/navigation.md) |
| Comment code, use surround, completion | [Editing](tasks/editing.md) |
| Rename, format, lint, see diagnostics | [Code Intelligence](tasks/code-intelligence.md) |
| Find files, grep, search symbols | [Searching](tasks/searching.md) |
| Stage hunks, blame, diff | [Git](tasks/git.md) |
| Set breakpoints, step through code | [Debugging](tasks/debugging.md) |

See [Task Guide](tasks/README.md) for quick reference.

## Quick Start

| Key | Action |
|-----|--------|
| `<leader>ff` | Find files |
| `<leader>fg` | Search in files |
| `gd` | Go to definition |
| `<leader>cr` | Rename symbol |
| `<leader>cf` | Format code |
| `gcc` | Toggle comment |
| `<leader>db` | Toggle breakpoint |

Leader key: `<Space>`

## Features

- **LSP** - Auto-installed language servers via Mason
- **Completion** - Context-aware with snippets
- **Debugging** - DAP for JVM debugging
- **Git** - Hunk staging, blame, diff
- **Telescope** - Fuzzy finding with ripgrep
- **Format on Save** - Consistent code style
- **AI Agents** - Claude Code and opencode embedded in the editor
- **Tokyo Night** - Modern UI with statusline

## Documentation

### Getting Started

- [Installation & Setup](getting-started.md)
- [Architecture](architecture.md)
- [Keybinding Reference](reference/keybindings.md)

### Task Guides

- [Navigation](tasks/navigation.md) - Windows, buffers, code jumps
- [Editing](tasks/editing.md) - Comments, surround, completion
- [Code Intelligence](tasks/code-intelligence.md) - LSP, formatting, diagnostics
- [Searching](tasks/searching.md) - Files, grep, symbols
- [Git](tasks/git.md) - Staging, blame, diff
- [Debugging](tasks/debugging.md) - Breakpoints, stepping

### Plugin Configuration

- [Plugin Overview](plugins/README.md)
- [LSP & Mason](plugins/lsp.md)
- [Completion](plugins/completion.md)
- [Telescope](plugins/telescope.md)
- [DAP Debugging](plugins/dap.md)
- [Gitsigns](plugins/gitsigns.md)
- [UI Enhancements](plugins/ui.md)
- [AI Agents](plugins/ai-agents.md)

### Language Support

- [Language Overview](languages/README.md)
- [Kotlin](languages/kotlin.md) | [Java](languages/java.md)
- [Python](languages/python.md) | [TypeScript](languages/typescript.md)
- [JSON](languages/json.md) | [CSV / TSV](languages/csv.md)

## Project Structure

```
~/.config/nvim/
├── init.lua              # Entry point
├── lua/
│   ├── config/
│   │   ├── options.lua   # Editor settings
│   │   └── keymaps.lua   # Global keybindings
│   └── plugins/          # Plugin configurations
└── docs/                 # Documentation
```
