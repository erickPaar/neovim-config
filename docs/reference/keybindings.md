---
title: "Keybinding Reference"
description: "Complete keybinding reference organized by task"
category: "reference"
related:
  - ../tasks/README.md
---

# Keybinding Reference

Leader key: `<Space>`

For task-specific guides, see [Task Guide](../tasks/README.md).

## Navigation

See [Navigation Guide](../tasks/navigation.md) for details.

### Window Management

| Key | Mode | Action |
|-----|------|--------|
| `Ctrl+h` | Normal | Move to left window |
| `Ctrl+j` | Normal | Move to down window |
| `Ctrl+k` | Normal | Move to up window |
| `Ctrl+l` | Normal | Move to right window |
| `Ctrl+Up` | Normal | Decrease window height |
| `Ctrl+Down` | Normal | Increase window height |
| `Ctrl+Left` | Normal | Decrease window width |
| `Ctrl+Right` | Normal | Increase window width |

### Buffer Navigation

| Key | Mode | Action |
|-----|------|--------|
| `Shift+h` / `bp` | Normal | Previous buffer |
| `Shift+l` / `bn` | Normal | Next buffer |
| `bc` | Normal | Close current buffer |
| `<leader>ba` | Normal | New empty buffer |
| `<leader>bi` | Normal | Pin/unpin buffer |
| `<leader>bx` | Normal | Close all other buffers |
| `<leader>fb` | Normal | List buffers (Telescope) |

Note: `<leader>bn`, `<leader>bp`, `<leader>bc` also work.

### Code Navigation (LSP)

| Key | Mode | Action |
|-----|------|--------|
| `gd` | Normal | Go to definition |
| `gD` | Normal | Go to declaration |
| `gr` | Normal | Go to references |
| `gi` | Normal | Go to implementation |
| `<leader>cd` | Normal | Go to type definition |

### Jump History

| Key | Mode | Action |
|-----|------|--------|
| `Ctrl+o` | Normal | Jump back |
| `Ctrl+i` | Normal | Jump forward |

### Reference Navigation (Illuminate)

| Key | Mode | Action |
|-----|------|--------|
| `]]` | Normal | Next reference |
| `[[` | Normal | Previous reference |

### File Explorer

| Key | Mode | Action |
|-----|------|--------|
| `<leader>e` | Normal | Toggle Neo-tree |
| `<leader>o` | Normal | Focus Neo-tree |

## Editing

See [Editing Guide](../tasks/editing.md) for details.

### Visual Mode

| Key | Mode | Action |
|-----|------|--------|
| `<` | Visual | Indent left (stay in visual) |
| `>` | Visual | Indent right (stay in visual) |
| `J` | Visual | Move selection down |
| `K` | Visual | Move selection up |

### Comments

| Key | Mode | Action |
|-----|------|--------|
| `gcc` | Normal | Toggle line comment |
| `gbc` | Normal | Toggle block comment |
| `gc{motion}` | Normal | Comment with motion |
| `gc` | Visual | Comment selection |
| `gb` | Visual | Block comment selection |

### Surround

| Key | Mode | Action |
|-----|------|--------|
| `ys{motion}{char}` | Normal | Add surrounding |
| `yss{char}` | Normal | Surround entire line |
| `cs{old}{new}` | Normal | Change surrounding |
| `ds{char}` | Normal | Delete surrounding |
| `S{char}` | Visual | Surround selection |

### Treesitter Selection

| Key | Mode | Action |
|-----|------|--------|
| `Ctrl+Space` | Normal | Start incremental selection |
| `Ctrl+Space` | Visual | Expand selection |
| `Backspace` | Visual | Shrink selection |

### Folding (JSON)

JSON files fold by structure: each object and array is a fold. They open with every fold open. Formatting, error navigation and `jq` are in the [JSON guide](../languages/json.md).

| Key | Mode | Action |
|-----|------|--------|
| `za` | Normal | Toggle the fold under the cursor |
| `zc` / `zo` | Normal | Close / open the fold under the cursor |
| `zM` / `zR` | Normal | Close / open every fold |
| `zj` / `zk` | Normal | Move to the next / previous fold |

### CSV / TSV

CSV and TSV files open as an aligned table. The file itself is unchanged. More in the [CSV guide](../languages/csv.md).

| Key | Mode | Action |
|-----|------|--------|
| `<leader>tc` | Normal | Toggle the table view |
| `Tab` / `Shift+Tab` | Normal, Visual | Move to the end of the next / previous field |
| `Enter` / `Shift+Enter` | Normal, Visual | Same field in the next / previous row |
| `if` / `af` | Operator, Visual | Field text object, without / with its comma (`cif`, `dif`, `vaf`) |

### Completion

| Key | Mode | Action |
|-----|------|--------|
| `Ctrl+Space` | Insert | Trigger completion |
| `Tab` | Insert | Next item / expand snippet |
| `Shift+Tab` | Insert | Previous item |
| `Enter` | Insert | Confirm selection |
| `Ctrl+e` | Insert | Abort completion |
| `Ctrl+b` | Insert | Scroll docs up |
| `Ctrl+f` | Insert | Scroll docs down |

## Code Intelligence

See [Code Intelligence Guide](../tasks/code-intelligence.md) for details.

### Hover and Documentation

| Key | Mode | Action |
|-----|------|--------|
| `K` | Normal | Hover documentation |
| `Ctrl+k` | Normal | Signature help |

### Code Actions (`<leader>c`)

| Key | Mode | Action |
|-----|------|--------|
| `<leader>ca` | Normal | Code action |
| `<leader>cr` | Normal | Rename symbol |
| `<leader>cd` | Normal | Type definition |
| `<leader>co` | Normal | Organize imports |
| `<leader>cf` | Normal | Format buffer |
| `<leader>cl` | Normal | Lint buffer |

### Diagnostic Navigation

| Key | Mode | Action |
|-----|------|--------|
| `[d` | Normal | Previous diagnostic |
| `]d` | Normal | Next diagnostic |

### Diagnostics Panel (`<leader>x`)

| Key | Mode | Action |
|-----|------|--------|
| `<leader>xf` | Normal | Show diagnostic float |
| `<leader>xl` | Normal | Set location list |
| `<leader>xx` | Normal | Toggle all diagnostics |
| `<leader>xX` | Normal | Toggle buffer diagnostics |
| `<leader>xs` | Normal | Toggle symbols |
| `<leader>xq` | Normal | Toggle quickfix |

### TODO Comments

| Key | Mode | Action |
|-----|------|--------|
| `]t` | Normal | Next TODO |
| `[t` | Normal | Previous TODO |
| `<leader>xt` | Normal | TODO list (Telescope) |

## Searching

See [Searching Guide](../tasks/searching.md) for details.

### File Finding (`<leader>f`)

| Key | Mode | Action |
|-----|------|--------|
| `<leader>ff` | Normal | Find files |
| `<leader>fr` | Normal | Recent files |
| `<leader>fb` | Normal | List buffers |

### Content Searching

| Key | Mode | Action |
|-----|------|--------|
| `<leader>fg` | Normal | Live grep |
| `<leader>fc` | Normal | Grep word under cursor |

### Symbol Searching

| Key | Mode | Action |
|-----|------|--------|
| `<leader>fs` | Normal | Document symbols |
| `<leader>fS` | Normal | Workspace symbols |
| `<leader>fd` | Normal | Diagnostics |

### Help

| Key | Mode | Action |
|-----|------|--------|
| `<leader>fh` | Normal | Help tags |

### Inside Telescope

| Key | Mode | Action |
|-----|------|--------|
| `Ctrl+j` | Insert | Move to next item |
| `Ctrl+k` | Insert | Move to previous item |
| `Ctrl+q` | Insert | Send to quickfix |
| `Ctrl+x` | Insert | Open in horizontal split |
| `Ctrl+v` | Insert | Open in vertical split |
| `Ctrl+t` | Insert | Open in new tab |
| `Esc` | Insert | Close |

## Git

See [Git Guide](../tasks/git.md) for details.

### Hunk Navigation

| Key | Mode | Action |
|-----|------|--------|
| `]h` | Normal | Next hunk |
| `[h` | Normal | Previous hunk |

### Staging (`<leader>h`)

| Key | Mode | Action |
|-----|------|--------|
| `<leader>hs` | Normal/Visual | Stage hunk |
| `<leader>hS` | Normal | Stage buffer |
| `<leader>hu` | Normal | Undo stage hunk |

### Reset

| Key | Mode | Action |
|-----|------|--------|
| `<leader>hr` | Normal/Visual | Reset hunk |
| `<leader>hR` | Normal | Reset buffer |

### Viewing

| Key | Mode | Action |
|-----|------|--------|
| `<leader>hp` | Normal | Preview hunk |
| `<leader>hb` | Normal | Blame line (full) |
| `<leader>hd` | Normal | Diff this |
| `<leader>hD` | Normal | Diff against parent |

### Toggles

| Key | Mode | Action |
|-----|------|--------|
| `<leader>tb` | Normal | Toggle line blame |
| `<leader>td` | Normal | Toggle deleted |

## Debugging

See [Debugging Guide](../tasks/debugging.md) for details.

### Breakpoints (`<leader>d`)

| Key | Mode | Action |
|-----|------|--------|
| `<leader>db` | Normal | Toggle breakpoint |
| `<leader>dB` | Normal | Conditional breakpoint |
| `<leader>dl` | Normal | Log point |

### Execution Control

| Key | Mode | Action |
|-----|------|--------|
| `<leader>dc` | Normal | Continue / Start |
| `<leader>di` | Normal | Step into |
| `<leader>do` | Normal | Step over |
| `<leader>dO` | Normal | Step out |
| `<leader>dr` | Normal | Restart |
| `<leader>dq` | Normal | Terminate |
| `<leader>dL` | Normal | Run last |

### UI & Inspection

| Key | Mode | Action |
|-----|------|--------|
| `<leader>du` | Normal | Toggle debug UI |
| `<leader>de` | Normal/Visual | Evaluate expression |
| `<leader>dR` | Normal | Toggle REPL |

## Markdown

See [Markdown Preview](../plugins/markview.md) for details.

| Key | Mode | Action |
|-----|------|--------|
| `<leader>tm` | Normal | Toggle markdown preview (buffer) |
| `<leader>tM` | Normal | Toggle markdown preview (global) |
| `<leader>ts` | Normal | Toggle markdown split preview |

## Leader Key Groups

| Prefix | Category |
|--------|----------|
| `<leader>b` | Buffer |
| `<leader>c` | Code |
| `<leader>d` | Debug |
| `<leader>f` | Find (Telescope) |
| `<leader>g` | Go to (vim g commands) |
| `<leader>G` | Git |
| `<leader>h` | Git Hunks |
| `<leader>t` | Toggle |
| `<leader>x` | Diagnostics |

Press `<leader>` and wait for which-key to show all options.
