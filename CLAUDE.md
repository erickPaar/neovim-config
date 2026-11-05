# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a modular Neovim configuration for multi-language development (Kotlin, Java, Python, JavaScript, TypeScript), using lazy.nvim as the plugin manager.

## Installation

```bash
git clone git@github.com:erickPaar/neovim-config.git ~/.config/nvim
```

`origin` is this fork (erickPaar/neovim-config); `upstream` is the repository it was forked from.

## Dependencies

- **ripgrep** - Required for Telescope file searching
  ```bash
  sudo apt install ripgrep
  ```
- **Node.js >= 14** - prettier, jsonls, pyright, ts_ls and eslint_d run on it; Ubuntu 22.04's own Node 12 makes them fail silently. See docs/getting-started.md.
- **jq** - Used by the JSON guide (docs/languages/json.md) for reshaping and queries.

## Architecture

**Load order:** `init.lua` loads `config.options` first (before lazy.nvim bootstrap), then lazy.nvim imports all files from `lua/plugins/`, and finally `config.keymaps` loads after plugins.

**Plugin pattern:** Each file in `lua/plugins/` returns a table of lazy.nvim plugin specs. Lazy.nvim auto-discovers and merges all specs via `{ import = "plugins" }`.

**LSP setup:** Mason auto-installs language servers (kotlin_language_server, jdtls, pyright, ts_ls). The `on_attach` function in `lua/plugins/lsp.lua` defines all LSP keybindings. To add a new language server, add it to `ensure_installed` and create a handler in the `handlers` table.

**Formatting/Linting:** conform.nvim handles formatting, nvim-lint handles linting. Both configured in `lua/plugins/formatting.lua` with language-specific tools (ktlint, google-java-format, black, prettier, ruff, eslint_d).

**Debugging:** nvim-dap provides Debug Adapter Protocol support for Kotlin/Java debugging. Mason auto-installs `java-debug-adapter`. Configuration in `lua/plugins/dap.lua`.

## Debugging Kotlin/Java

Start your application with the debug agent:
```bash
./gradlew run --debug-jvm
```

Then in Neovim:
1. Set breakpoints with `<leader>db`
2. Start debugging with `<leader>dc`
3. Select "Attach to JVM (port 5005)"

Key debug bindings (`<leader>d` prefix):
- `db` - Toggle breakpoint
- `dc` - Continue/Start
- `di/do/dO` - Step into/over/out
- `du` - Toggle debug UI
- `de` - Evaluate expression
- `dq` - Terminate

## Adding a New Plugin

Create a new file in `lua/plugins/` returning a lazy.nvim spec:
```lua
return {
  {
    "author/plugin-name",
    event = "VeryLazy",  -- or other lazy-loading trigger
    opts = {},
  },
}
```

## Adding a New Language Server

1. Add server name to `ensure_installed` in `lua/plugins/lsp.lua`
2. Add `lspconfig.<server>.setup({ capabilities = capabilities, on_attach = on_attach })` in the config function
3. Optionally add formatter/linter to `lua/plugins/formatting.lua`

## Key Configuration Files

- `lua/config/options.lua` - Leader key must be set here before lazy.nvim loads
- `lua/plugins/lsp.lua` - Central LSP keybindings in `on_attach` function
- `lua/plugins/formatting.lua` - Format-on-save and linter configuration
- `lua/plugins/dap.lua` - Debug Adapter Protocol configuration for Kotlin/Java

## Documentation

Full documentation is available in the `docs/` folder:

- [Getting Started](docs/getting-started.md) - Installation and setup
- [Architecture](docs/architecture.md) - Configuration structure
- [Keybindings](docs/reference/keybindings.md) - Complete keybinding reference
- [Plugins](docs/plugins/README.md) - Plugin documentation
- [Languages](docs/languages/README.md) - Language-specific setup
