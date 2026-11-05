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

Every object and array is a fold, nested as deep as the JSON goes. A file of AWS task definitions, for example, folds five levels: the file, the list of containers, each container, its environment list, and each variable. Files open with all folds open.

| Key | Action |
|-----|--------|
| `zM` | Fold everything |
| `zr` | Open **one more level** everywhere (repeat to go deeper) |
| `zm` | Close one level everywhere |
| `zR` | Open everything |
| `zo` / `zc` | Open / close the fold under the cursor |
| `zO` / `zC` | Open / close the fold under the cursor **and every fold inside it** |
| `za` / `zA` | Toggle the fold under the cursor (`zA` includes the folds inside) |
| `zj` / `zk` | Move to the next / previous fold |
| `[z` / `]z` | Move to the start / end of the fold the cursor is in |

### Reading a large file

1. Press `zM`, then `zr`. Only the top-level keys are left, and each nested object or array is a single line ending in `...`.
2. Move to the part you want and press `zo` to open one level of it, or `zO` to open all of it.
3. Press `zM` to collapse everything again.

To jump straight to a depth, use `:set foldlevel=1` (top-level keys only) or `:set foldlevel=2` (one level more).

`:set foldcolumn=auto:5` adds a narrow column on the left that marks each fold. You can click it with the mouse to open or close a fold.

Folding is set in `lua/config/options.lua`, for the `json` and `jsonc` filetypes.

## Querying with jq

### :Jq (recommended)

`:Jq` runs `jq` on the buffer and shows the result in a side window. The buffer doesn't need to be saved, so it works on a scratch buffer too. Running `:Jq` again replaces the result in the same window, and the cursor stays in your JSON so you can keep refining the query.

| Command | Result |
|---------|--------|
| `:Jq .items[0]` | Show the first item |
| `:Jq [.items[] \| {name, image}]` | Show two fields from every item |
| `:Jq -r .items[].name` | Plain text, one name per line (jq options go before the filter) |
| `:Jq` | Pretty-print the whole buffer in the side window |
| `:'<,'>Jq .` | Only the selected lines (select with `V`; they must be valid JSON on their own) |
| `:Jq! -S .` | Replace the buffer with the result, here with the keys sorted. `u` undoes it. |

The result window is a normal buffer: search it, yank from it, or close it with `:q`. A jq error appears as a message, and your buffer isn't changed. The command is defined in `lua/config/jq.lua`.

### Shell commands

To look at part of a saved file without changing it, run `jq` on it directly. `%` is the current file's name.

| Command | Shows |
|---------|-------|
| `:!jq '.dependencies' %` | One key |
| `:!jq '.items \| length' %` | How many items an array has |
| `:!jq '.items[0]' %` | The first item |
| `:!jq '[.items[] \| .name]' %` | One field from every item |
| `:!jq 'keys' %` | The top-level keys |

Copy only the command. Don't add a `"` comment after it: in a `:!` command, everything after `!` goes to the shell, and a stray `"` breaks it.

To replace the buffer with the result, use `:%!jq '<query>'` instead. Press `u` to get the original back.

## JSON with comments (jsonc)

Files such as `tsconfig.json` or `.vscode/settings.json` allow comments. Neovim opens files ending in `.jsonc` as `jsonc`, with the same formatting and folding. A comment in a file opened as plain `json` is reported as an error. To accept comments in that buffer, run `:set filetype=jsonc`.
