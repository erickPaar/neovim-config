---
title: "Getting Started"
description: "Installation and first steps with the Neovim configuration"
category: "core"
related:
  - README.md
  - architecture.md
---

# Getting Started

## Prerequisites

- **Neovim** >= 0.9.0
- **Git** - For cloning and plugin management
- **A Nerd Font** - For icons (recommended: JetBrains Mono Nerd Font)
- **Node.js >= 14** - prettier, jsonls, pyright, ts_ls and eslint_d run on Node. Ubuntu 22.04's own `nodejs` package is version 12, which is too old. These tools then fail without a clear message: nothing gets formatted, and their language servers don't start. Check with `node --version`. To install the current long-term-support version from NodeSource:

  ```bash
  sudo apt remove nodejs npm libnode-dev libnode72   # only if Ubuntu's old Node is installed
  curl -fsSL https://deb.nodesource.com/setup_24.x | sudo -E bash -
  sudo apt install -y nodejs
  ```

## Installation

### 1. Clone the Repository

```bash
git clone git@github.com:erickPaar/neovim-config.git ~/.config/nvim
```

This repository is a fork. GitHub shows the original under the repository name ("forked from …"). To pull in changes made there:

```bash
git remote add upstream <URL of the original repository>   # once
git fetch upstream && git merge upstream/main
```

### 2. Install System Dependencies

#### Required

```bash
# ripgrep - Required for Telescope file searching
sudo apt install ripgrep
```

#### Recommended

```bash
# fd - Faster file finding (optional)
sudo apt install fd-find

# xclip - System clipboard support
sudo apt install xclip

# jq - Reshaping and querying JSON (see languages/json.md)
sudo apt install jq
```

### 3. First Launch

```bash
nvim
```

On first launch:
1. **lazy.nvim** will auto-install itself
2. All plugins will be downloaded and installed
3. **Mason** will install language servers and tools

This may take a few minutes on the first run.

## Verifying Installation

### Check Plugin Status

```vim
:Lazy
```

Shows all installed plugins and their status.

### Check LSP Status

```vim
:Mason
```

Verify language servers are installed:
- `kotlin_language_server`
- `jdtls`
- `pyright`
- `typescript-language-server`

### Check Health

```vim
:checkhealth
```

Identifies any configuration issues.

## First Steps

### 1. Open a File

```bash
nvim myfile.kt
```

### 2. Try Telescope

Press `<Space>ff` to find files in the current directory.

### 3. Explore Keybindings

Press `<Space>` and wait - **which-key** will show available commands.

### 4. Open File Explorer

Press `<Space>e` to toggle the file tree.

## Customization

### Adding a Plugin

Create a new file in `lua/plugins/`:

```lua
-- lua/plugins/myplugin.lua
return {
  {
    "author/plugin-name",
    event = "VeryLazy",
    opts = {},
  },
}
```

See [Architecture](architecture.md) for details on the plugin system.

### Changing the Theme

Edit `lua/plugins/colorscheme.lua`:

```lua
opts = {
  style = "storm",  -- Options: night, storm, day, moon
},
```

## Troubleshooting

### Plugins Not Loading

```vim
:Lazy sync
```

### LSP Not Working

1. Check Mason: `:Mason`
2. Check LSP status: `:LspInfo`
3. Check logs: `:LspLog`

### Icons Not Displaying

Install a Nerd Font and configure your terminal to use it.

## Related

- [Architecture](architecture.md) - Understanding the configuration structure
- [Keybindings](reference/keybindings.md) - Complete keybinding reference
- [Plugin Overview](plugins/README.md) - All installed plugins
