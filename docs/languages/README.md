---
title: "Language Support"
description: "Overview of supported languages and their configurations"
category: "languages"
related:
  - ../README.md
  - ../plugins/lsp.md
---

# Language Support

This configuration provides full IDE-like support for multiple languages.

## Supported Languages

| Language | LSP | Formatter | Linter | Debugger |
|----------|-----|-----------|--------|----------|
| [Kotlin](kotlin.md) | kotlin_language_server | ktlint | ktlint | java-debug-adapter |
| [Java](java.md) | jdtls | google-java-format | - | java-debug-adapter |
| [Python](python.md) | pyright | black | ruff | - |
| [TypeScript](typescript.md) | ts_ls | prettier | eslint_d | - |
| [JavaScript](typescript.md) | ts_ls | prettier | eslint_d | - |

### Data Formats

| Format | Formatter | Syntax Highlighting |
|--------|-----------|---------------------|
| [JSON / jsonc](json.md) | prettier (jsonls checks errors; folding by structure) | Treesitter |
| [CSV / TSV](csv.md) | - (aligned table view with csvview.nvim) | Treesitter |
| XML | xmllint | Treesitter |
| YAML | - | Treesitter |
| TOML | - | Treesitter |

## Features Per Language

### All Languages

- **Syntax highlighting** (Treesitter)
- **Go to definition** (`gd`)
- **Find references** (`gr`)
- **Hover documentation** (`K`)
- **Code actions** (`<leader>ca`)
- **Rename symbol** (`<leader>cr`)
- **Format on save**

### JVM Languages (Kotlin, Java)

- **Debugging** with DAP
- **Organize imports** (`<leader>co`)
- **Build integration** (Gradle/Maven)

### Web Languages (TypeScript, JavaScript)

- **JSX/TSX support**
- **Auto-imports**
- **ESLint integration**

## Quick Setup

### Opening a Project

1. Navigate to project root
2. Open Neovim: `nvim .`
3. LSP auto-starts based on file type
4. Mason installs missing tools automatically

### Verifying Language Support

```vim
:LspInfo
```

Shows attached language servers for current buffer.

### Checking Installed Tools

```vim
:Mason
```

Shows all installed language servers, formatters, and linters.

## Adding a New Language

### Step 1: Add Language Server

In `lua/plugins/lsp.lua`:

```lua
ensure_installed = {
  -- existing servers...
  "new_language_server",
},
```

### Step 2: Configure Server

Add handler in `lua/plugins/lsp.lua`:

```lua
["new_language_server"] = function()
  lspconfig.new_language_server.setup({
    capabilities = capabilities,
    on_attach = on_attach,
  })
end,
```

### Step 3: Add Formatter/Linter (Optional)

In `lua/plugins/formatting.lua`:

```lua
-- Formatters
formatters_by_ft = {
  newlang = { "new_formatter" },
},

-- Linters
linters_by_ft = {
  newlang = { "new_linter" },
},
```

### Step 4: Add Treesitter Parser

In `lua/plugins/treesitter.lua`:

```lua
ensure_installed = {
  -- existing parsers...
  "newlang",
},
```

## Working with New Files

When creating a new file without an extension, Neovim won't automatically detect the filetype for syntax highlighting and formatting.

### Set Filetype Manually

```vim
:set filetype=xml
:set filetype=json
```

### Auto-Detection Methods

**XML** - Add XML declaration at the top:
```xml
<?xml version="1.0"?>
```

**JSON** - Save with `.json` extension or set filetype manually.

### Format and Validate

Once filetype is set, use `<leader>cf` to format. Invalid syntax will show an error.

## Troubleshooting

### LSP Not Starting

1. Check file type: `:set ft?`
2. Check LSP status: `:LspInfo`
3. Check Mason: `:Mason`
4. View LSP logs: `:LspLog`

### Formatting Not Working

1. Check formatter is installed: `:Mason`
2. Test manually: `:lua require("conform").format()`
3. Check formatter for filetype in config

### Linting Not Running

1. Check linter is installed: `:Mason`
2. Trigger manually: `<leader>cl`
3. Check linter for filetype in config

## Related

- [Kotlin](kotlin.md) - Kotlin-specific setup
- [Java](java.md) - Java-specific setup
- [Python](python.md) - Python-specific setup
- [TypeScript](typescript.md) - TypeScript/JavaScript setup
- [LSP Configuration](../plugins/lsp.md) - Detailed LSP setup
