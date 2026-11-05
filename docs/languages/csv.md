---
title: "CSV and TSV"
description: "Viewing CSV/TSV files as aligned tables, navigating fields, and editing columns"
category: "languages"
related:
  - README.md
  - ../reference/keybindings.md
---

# CSV and TSV

## Overview

| Component | Tool |
|-----------|------|
| Table view | [csvview.nvim](https://github.com/hat0uma/csvview.nvim) (`lua/plugins/csv.lua`) |
| Syntax Highlighting | Treesitter (`csv`, `tsv` parsers) |
| Formatter | - (on purpose, see below) |

## The table view

CSV and TSV files open already aligned as a table. A `│` is drawn between columns, and the header row stays pinned at the top of the window while you scroll.

**The alignment is only on screen.** The file keeps its commas or tabs: nothing is padded, saving writes exactly what you typed, and git diffs show only real changes.

| Key / Command | Action |
|---------------|--------|
| `<leader>tc` | Toggle between the table and the raw text |
| `:CsvViewEnable display_mode=highlight` | Color the commas instead of drawing `│` |
| `:CsvViewEnable sticky_columns=1` | Also pin the first column while scrolling sideways, like a spreadsheet's frozen pane. Turn the view off with `<leader>tc` first. |

Quoted fields such as `"Rio, RJ"` count as one field. Lines starting with `#` or `//` are treated as comments.

## Moving around

| Key | Mode | Action |
|-----|------|--------|
| `Tab` / `Shift+Tab` | Normal, Visual | Move to the end of the next / previous field |
| `Enter` / `Shift+Enter` | Normal, Visual | Same field in the next / previous row |

`Shift+Enter` doesn't reach Neovim in some terminals. If it does nothing, use `k`.

## Editing fields

Fields are text objects, so Vim's operators work on them:

| Keys | Action |
|------|--------|
| `cif` | Change the field's content |
| `dif` | Empty the field (its commas stay) |
| `daf` | Delete the field and its comma (shifts the row's later fields left) |
| `yif` | Copy the field's content |
| `vif` / `vaf` | Select the field, without / with its comma |

## Sorting and other edits

Sorting is done with the system's `sort` on the data rows, line 2 to the end, so the header stays in place:

| Command | Result |
|---------|--------|
| `:2,$sort` | Sort rows by their whole text, which in practice is the first column |
| `:2,$!sort -t, -k2,2` | Sort by the 2nd column, as text |
| `:2,$!sort -t, -k3,3n` | Sort by the 3rd column, as numbers |
| `:2,$!sort -t, -k3,3nr` | Same, largest first |

`sort -t,` splits on every comma, including commas inside quoted fields. Use it only when no field holds a quoted comma. For a TSV file, use `-t$'\t'` in a shell. Press `u` to undo.

## Why there's no formatter

"Formatting" a CSV usually means padding the columns with spaces to line them up. That changes the data: every field gets extra spaces, and any program reading the file sees them. The table view gives you the aligned look without touching the file. To strip stray spaces after commas that are already in a file, run `:%s/,\s\+/,/g`.
