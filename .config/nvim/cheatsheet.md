# Neovim cheat sheet

Open with `:Cheatsheet` or `<leader>?`. Leader is `Space`.

## Leader keys

| Key                    | Does                                            |
|------------------------|-------------------------------------------------|
| **Find**               |                                                 |
| `<leader>p`            | Files                                           |
| `<leader>o`            | Git files                                       |
| `<leader>c`            | Changed files (git status)                      |
| `<leader>b`            | Buffers                                         |
| **Search**             |                                                 |
| `<leader>a`            | Grep for a term                                 |
| `<leader>s`            | Grep word under cursor (visual: the selection)  |
| `<leader>j` / `k`      | Next / previous quickfix item                   |
| `<leader>/`            | Clear search highlight                          |
| **LSP**                |                                                 |
| `<leader>l`            | Find a symbol anywhere in the project           |
| `<leader>d`            | All diagnostics in the project                  |
| `<leader>f`            | Format the file                                 |
| `<leader>i`            | Inlay hints (parameter names, types) on / off   |
| **Files**              |                                                 |
| `<leader>e`            | File browser (netrw)                            |
| `<leader>r`            | Back to the file browser                        |
| `<leader>u`            | Undo tree on / off (moving in it undoes/redoes) |
| `<leader>v`            | Edit init.lua                                   |
| `<leader>q`            | Quit window                                     |
| **Saving**             |                                                 |
| `<leader>A`            | Autosave on / off (`:w` saves by hand)          |
| **Editing**            |                                                 |
| `<leader>t`            | Trim trailing whitespace                        |
| `<leader>w`            | Spell check on / off                            |
| **Windows**            |                                                 |
| `<leader>+` / `-`      | Taller / shorter                                |
| `<leader>>` / `<`      | Wider / narrower                                |
| **Help**               |                                                 |
| `<leader>?`            | This cheat sheet                                |

## Navigation

| Key           | Does                                                  |
|---------------|-------------------------------------------------------|
| `gd`          | Go to definition                                      |
| `Ctrl-]`      | Go to definition (built-in alternative)               |
| `Ctrl-w ]`    | Go to definition in a split                           |
| `Ctrl-w }`    | Preview definition without moving                     |
| `grr`         | References (quickfix; step with `<leader>j/k`)        |
| `gri`         | Go to implementation                                  |
| `grt`         | Go to type definition                                 |
| `gO`          | Symbols in this file                                  |
| `Ctrl-o/i`    | Jump back / forward                                   |

## Editing and refactoring

| Key           | Does                                                  |
|---------------|-------------------------------------------------------|
| `grn`         | Rename symbol across the project                      |
| `gra`         | Code actions; on a visual selection: extract function/variable |
| `gq{motion}`  | Format (`gqq` line, `gqip` paragraph, `gggqG` file)   |
| `grx`         | Run code lens (e.g. gopls "run test")                 |
| `an` / `in`   | Visual mode: grow / shrink selection                  |

## Information

| Key           | Does                                                  |
|---------------|-------------------------------------------------------|
| `K`           | Hover docs (press again to enter the popup)           |
| `Ctrl-s`      | Insert mode: signature help                           |
| `gx`          | Open the server's link for the symbol (e.g. Go docs)  |

## Diagnostics

| Key           | Does                                                  |
|---------------|-------------------------------------------------------|
| `]d` / `[d`   | Next / previous diagnostic                            |
| `]D` / `[D`   | Last / first diagnostic in the file                   |
| `Ctrl-w d`    | Show diagnostic under cursor in a popup               |

## Completion (insert mode)

| Key           | Does                                                  |
|---------------|-------------------------------------------------------|
| `Ctrl-y`      | Accept                                                |
| `Ctrl-n/p`    | Next / previous item                                  |
| `Ctrl-space`  | Open menu (again: docs)                               |
| `Ctrl-e`      | Close menu                                            |
| `Ctrl-k`      | Toggle signature help                                 |
| `Ctrl-b/f`    | Scroll docs popup                                     |

## Commands

| Command                       | Does                                  |
|-------------------------------|---------------------------------------|
| `:checkhealth vim.lsp`        | Attached servers and problems         |
| `:lsp restart`                | Restart servers (e.g. after `go.mod` changes) |
