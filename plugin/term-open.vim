let s:locationCommands = {
\   'buffer' : 'enew',
\   'window' : 'wincmd n',
\   'tab'    : 'tabe'
\ }

let s:consoleOptions = {
\   'location'  : 'window',
\   'after'     : 'wincmd J',
\   'insert'    : 1,
\   'resize'    : 10,
\   'fixheight' : 1
\ }

function! TermOpen(...)
  let options = (a:0 >= 1) ? a:1 : {}
  let defaults = { 'command': '$SHELL', 'before': '', 'after': '' }
  call extend(options, defaults, 'keep')

  " -- Console helper option -----------------------------------------------------------------------

  if has_key(options, 'console')
    if has_key(options, 'after')
      let options.after = options.after . ' | ' . s:consoleOptions.after
    endif

    call extend(options, s:consoleOptions, 'keep')
  endif

  " -- Before hook helper options ------------------------------------------------------------------

  if has_key(options, 'location')
    let location = tolower(options.location)

    if has_key(s:locationCommands, location)
      let locationCommand = s:locationCommands[location]
      let options.before = options.before . ' | ' . locationCommand
    endif
  endif

  " -- After hook helper options -------------------------------------------------------------------

  if has_key(options, 'insert')
    let options.after = options.after . ' | startinsert'
  endif

  if has_key(options, 'resize')
    let options.after = options.after . ' | resize' . options.resize
  endif

  if has_key(options, 'fixheight')
    let options.after = options.after . ' | set winfixheight'
  endif

  " -- Execution -----------------------------------------------------------------------------------

  if has_key(options, 'before')
    let options.before = substitute(options.before, "^ *| *", "", "")

    execute options.before
  endif

  call termopen(options.command)

  if has_key(options, 'after')
    let options.after = substitute(options.after, "^ *| *", "", "")

    execute options.after
  endif
endfunction

function! TermOpenCommand(...)
  let options = {}

  for arg in a:000
     let partials = split(arg, '=')

     if len(partials) > 1
       let options[partials[0]] = partials[1]
     else
       let options[partials[0]] = 1
     endif
  endfor

  call TermOpen(options)
endfunction

command! -nargs=* TermOpen call TermOpenCommand(<f-args>)
command! -nargs=* TermOpenConsole call TermOpenCommand('console', <f-args>)

