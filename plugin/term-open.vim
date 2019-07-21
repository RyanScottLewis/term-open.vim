function! TermOpen(cmd, ...)
  let opts = (a:0 >= 1) ? a:1 : {}

  if has_key(opts, "location") " TODO: Type check needed?
    if opts["location"] == "buffer" " TODO Use :execute! and a dict for this sort of thing
      enew
    elseif opts["location"] == "window"
      wincmd n
    elseif opts["location"] == "tab"
      tabe
    endif
  endif

  call termopen(a:cmd)

  if has_key(opts, "command")
    execute opts["command"]
  endif

  if has_key(opts, "insert")
    startinsert
  endif
endfunction

function! TermOpenConsole(cmd, ...)
  let opts     = (a:0 >= 1) ? a:1 : {}
  let defaults = {
  \   "location" : "window",
  \   "command"  : "wincmd J",
  \   "insert"   : 1,
  \   "resize"   : 10,
  \   "fixheight": 1
  \ }

  call extend(opts, defaults, "keep")

  if has_key(opts, "resize")
    let opts.command = opts["command"] . " | resize " . opts["resize"]
  endif

  if has_key(opts, "fixheight")
    let opts.command = opts["command"] . " | set winfixheight"
  endif

  call TermOpen(a:cmd, opts)
endfunction

command! -nargs=+ TermOpen call TermOpen(<args>)
command! -nargs=+ TermOpenConsole call TermOpenConsole(<args>)

