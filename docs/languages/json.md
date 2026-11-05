---
title: "JSON"
description: "Formatting, validating, navigating, folding and querying JSON files"
category: "languages"
related:
  - README.md
  - ../reference/keybindings.md
  - ../plugins/lsp.md
---

# JSON

## Overview

| Component | Tool |
|-----------|------|
| Language Server | `jsonls` (`vscode-json-language-server`, installed by Mason) |
| Formatter | `prettier` (conform.nvim), plus `jq` for other layouts |
| Folding | Treesitter |
| Syntax Highlighting | Treesitter |

`prettier` and `jsonls` run on Node.js and need **Node 14 or newer**. With an older Node they fail without a clear message: nothing gets formatted and no errors are shown. See [Getting Started](../getting-started.md#prerequisites).

## Formatting

The file is formatted with `prettier` every time you save. To format it without saving:

| Key | Action |
|-----|--------|
| `<leader>cf` | Format the buffer with prettier |

`prettier` keeps a short object on one line when it fits. For other layouts, pipe the buffer through `jq`. Press `u` to undo any of these.

| Command | Result |
|---------|--------|
| `:%!jq .` | Expand everything: one key per line, 2-space indent |
| `:%!jq -c .` | Compact the whole file onto one line |
| `:%!jq -S .` | Sort every object's keys alphabetically |
| `:%!jq --indent 4 .` | Expand with a 4-space indent |
| `:'<,'>!jq .` | Format only the lines selected with `V` (they must be valid JSON on their own) |

`jq` comes from the system (`sudo apt install jq`), not from Mason.

## Errors

`jsonls` checks the file as you type. Mistakes such as a trailing comma, a missing quote or a duplicate key are underlined.

| Key | Action |
|-----|--------|
| `]d` / `[d` | Next / previous error |
| `<leader>xf` | Show the error under the cursor |
| `<leader>fd` | List every error (Telescope) |
| `<leader>xx` | Diagnostics panel (Trouble) |

## Navigating

| Key | Action |
|-----|--------|
| `<leader>fs` | Search the file's keys and jump to one (Telescope) |
| `<leader>xs` | Outline of every key in a side panel (Trouble) |
| `%` | Jump between a `{` or `[` and the bracket that closes it |
| `K` | Hover: the key's description when the file has a JSON schema |

## Folding

Every object and array is a fold. Files open with all folds open.

| Key | Action |
|-----|--------|
| `za` | Toggle the fold under the cursor |
| `zc` / `zo` | Close / open the fold under the cursor |
| `zM` / `zR` | Close / open every fold |
| `zj` / `zk` | Move to the next / previous fold |

`zM` followed by `zo` on the top-level object shows just the first level of keys, which is a quick way to see a large file's shape.

Folding is set in `lua/config/options.lua`, for the `json` and `jsonc` filetypes.

## Querying with jq

To look at part of a file without changing it, run `jq` on the saved file. `%` is the current file's name.

```vim
:!jq '.dependencies' %              " one key
:!jq '.items | length' %            " how many items an array has
:!jq '.items[0]' %                  " the first item
:!jq '[.items[] | .name]' %         " one field from every item
:!jq 'keys' %                       " the top-level keys
```

To replace the buffer with the result, use `:%!jq '<query>'` instead. Press `u` to get the original back.

## JSON with comments (jsonc)

Files such as `tsconfig.json` or `.vscode/settings.json` allow comments. Neovim opens files ending in `.jsonc` as `jsonc`, with the same formatting and folding. A comment in a file opened as plain `json` is reported as an error. To accept comments in that buffer, run `:set filetype=jsonc`.
