# TermOpen

A smarter `termopen` function for NeoVim.

## Install

### Plug: `Plug 'RyanScottLewis/term-open.vim'`

## Usage

```vim
" In a new tab in insert mode
:call TermOpen("/bin/zsh", { "location" : "tab", "insert" : 1 })

" In a new window, run `webpack --watch`, move to bottom of screen, resize to 10 lines, then move cursor back to previous window
:call TermOpen("/usr/bin/webpack --watch", { "location" : "window", "command" : "wincmd J | resize 10 | wincmd p" })

" Shortcut for opening a new window at the bottom of the screen, resized, and started in insert mode
:call TermOpenConsole("/bin/zsh")
```

Here is my usage in my `init.vim`:

```vim
nmap <leader>T :call TermOpenConsole("/bin/zsh")<CR>
nmap <leader>Tt :call TermOpen("/bin/zsh", { "location" : "tab", "insert" : 1 })<CR>
nmap <leader>Th :call TermOpen("/bin/zsh", { "location" : "window", "insert" : 1, "command" : "wincmd L" })<CR>
```

In this setup, `<leader>T` will open a terminal in a bottom console, but if I quickly type `t` afterwards,
it will open in a new tab. If I quickly type `h` after, it will open in a new window pulled to the right.

### Documentation

Refer to `:help term-open` for more usage instructions.

## Contributing

1. Fork it
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [RyanScottLewis](https://github.com/RyanScottLewis) Ryan Scott Lewis - creator, maintainer

