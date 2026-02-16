# nvim config — keybinds and commands

leader is space.

## general

| bind | mode | what it does |
|------|------|-------------|
| `ctrl+h/j/k/l` | normal | move between splits |
| `J` / `K` | visual | move selected lines down/up |
| `ctrl+d` / `ctrl+u` | normal | scroll half page (centered) |
| `n` / `N` | normal | next/prev search match (centered) |
| `esc` | normal | clear search highlight |
| `space p` | visual | paste without clobbering register |

## searching (telescope)

| bind | what it does |
|------|-------------|
| `space ff` | find files |
| `space fg` | grep across files |
| `space fb` | open buffers |
| `space fh` | help tags |
| `space fo` | recent files |

## lsp

these only work when a language server is attached.

| bind | what it does |
|------|-------------|
| `gd` | go to definition |
| `gD` | go to declaration |
| `gr` | references |
| `gi` | implementation |
| `K` | hover docs |
| `space ca` | code action |
| `space rn` | rename |
| `space D` | type definition |
| `space d` | show diagnostic popup |
| `[d` / `]d` | prev/next diagnostic |

## autocomplete

| bind | mode | what it does |
|------|------|-------------|
| `ctrl+n` / `ctrl+p` | insert | cycle completions |
| `tab` / `shift+tab` | insert | cycle completions / snippet jump |
| `enter` | insert | confirm selection |
| `ctrl+space` | insert | open completion menu |
| `ctrl+e` | insert | dismiss |
| `ctrl+b` / `ctrl+f` | insert | scroll docs |

## git (gitsigns)

| bind | what it does |
|------|-------------|
| `]h` / `[h` | next/prev hunk |
| `space hs` | stage hunk |
| `space hr` | reset hunk |
| `space hp` | preview hunk |
| `space hb` | blame current line |
| `space hd` | diff this file |

## code runner

| bind | what it does |
|------|-------------|
| `space r` | run current file |
| `space rc` | close runner output |

languages: python, lua, c, c++ (c++17), rust, bash

## commands

| command | what it does |
|---------|-------------|
| `:Lazy` | plugin manager |
| `:Mason` | lsp server manager |
| `:RunCode` | run current file |
| `:TSUpdate` | update treesitter parsers |
| `:TSInstall <lang>` | install a treesitter parser |

## language servers

managed automatically — only starts if the binary is found.

| server | language | how to install |
|--------|----------|----------------|
| lua_ls | lua | auto (mason) |
| clangd | c/c++ | `pacman -S clang` |
| pyright | python | `pacman -S npm` then `:MasonInstall pyright` |
| rust-analyzer | rust | `pacman -S rust-analyzer` |

## system deps

things you might need to install if they're missing:

```
sudo pacman -S tree-sitter-cli npm rust-analyzer
```
