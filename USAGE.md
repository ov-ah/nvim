# Neovim Config — Keybinds & Commands Reference

Leader key: **Space**

## General

| Bind | Mode | Action |
|------|------|--------|
| `<C-h/j/k/l>` | Normal | Navigate between splits |
| `J` / `K` | Visual | Move selected lines down/up |
| `<C-d>` / `<C-u>` | Normal | Scroll down/up (centered) |
| `n` / `N` | Normal | Next/prev search result (centered) |
| `<Esc>` | Normal | Clear search highlight |
| `<leader>p` | Visual | Paste without overwriting register |

## Searching (Telescope)

| Bind | Action |
|------|--------|
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep (search in files) |
| `<leader>fb` | Open buffers |
| `<leader>fh` | Help tags |
| `<leader>fo` | Recent files |

## LSP

| Bind | Action |
|------|--------|
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `gr` | Go to references |
| `gi` | Go to implementation |
| `K` | Hover documentation |
| `<leader>ca` | Code action |
| `<leader>rn` | Rename symbol |
| `<leader>D` | Type definition |
| `<leader>d` | Show diagnostic float |
| `[d` / `]d` | Previous/next diagnostic |

## Autocomplete (nvim-cmp)

| Bind | Mode | Action |
|------|------|--------|
| `<C-n>` / `<C-p>` | Insert | Next/prev completion item |
| `<Tab>` / `<S-Tab>` | Insert | Cycle completions or snippet jumps |
| `<CR>` | Insert | Confirm selected completion |
| `<C-Space>` | Insert | Trigger completion manually |
| `<C-e>` | Insert | Dismiss completion menu |
| `<C-b>` / `<C-f>` | Insert | Scroll docs up/down |

## Code Runner

| Bind | Action |
|------|--------|
| `<leader>r` | Run current file |
| `<leader>rc` | Close runner output |

Supported: Python (`python3`), Lua (`lua`), C (`gcc`), C++ (`g++ -std=c++17`), Bash

## Commands

| Command | Action |
|---------|--------|
| `:Lazy` | Open plugin manager |
| `:Mason` | Open LSP server manager |
| `:RunCode` | Run current file |
| `:TSUpdate` | Update treesitter parsers |
