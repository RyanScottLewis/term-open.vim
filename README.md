# TermOpen

A smarter `termopen` function for NeoVim.

## Install

### Plug: `Plug 'RyanScottLewis/term-open.vim'`

### Vundle: `Plugin 'RyanScottLewis/term-open.vim'`

### Manual

> Assumes `$runtimepath` is some path from your VIM `runtimepath` variable.

#### Standard

```sh
git clone https://github.com/RyanScottLewis/term-open.vim.git
cd term-open.vim
cp doc/term-open.txt $runtimepath/doc/
cp plugin/term-open.vim $runtimepath/plugin/
```

#### VIM Package

```sh
cd $runtimepath/pack/bundle/start
git clone https://github.com/RyanScottLewis/term-open.vim.git
```

## Usage

```vim
" In a new tab in insert mode
:call TermOpen({ "location" : "tab", "insert" : 1 })
:TermOpen location=tab insert=1
:TermOpen location=tab insert

" Shortcut for opening a new window at the bottom of the screen, resized, and started in insert mode
:call TermOpen({ "console" : 1 })
:TermOpen console
```

To use with [Startify][startify], you need to set the `location` option (`"buffer"` is recommended):

```vim
let g:startify_commands = [
\   {'h': [ 'Help', ':help' ]},
\   {'t': [ 'Terminal', 'call TermOpen("/bin/zsh", {
\     "location" : "buffer",
\     "insert" : 1
\   })' ]}
\ ]
```

### Documentation

Refer to `:help term-open` for more usage instructions.

## Contributing

1. Fork it
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [RyanScottLewis][RyanScottLewis] Ryan Scott Lewis - creator, maintainer

[RyanScottLewis]: https://github.com/RyanScottLewis
[Startify]: https://github.com/mhinz/vim-startify
