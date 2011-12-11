let s:libpath = expand("<sfile>:p:h:h") . "/lib"

function! s:calculateTime() range
  let prog = a:firstline.','.a:lastline .
        \ '!ruby -I' .
        \ s:libpath .
        \ " -rharvestime -lne 'puts Harvestime.convert($_)'"
  exec ':'.prog."\<CR>"
endfunction

function! s:calculateTotal() range
  let prog = a:firstline.','.a:lastline .
        \ '!ruby -I' .
        \ s:libpath .
        \ " -rharvestime -e 'f = STDIN.read; puts f; puts \"              \" + Harvestime.total(f) + \" Total\"'"
  exec ':'.prog."\<CR>"
endfunction

function! s:insertTimestamp()
  let format = '%H:%M'
  let line = getline('.')
  if line =~ '^\d\d:\d\d - \d\d:\d\d [\d ]\d:\d\d'
    return
  elseif line =~ '^\d\d:\d\d - \d\d:\d\d'
    exec 'CalculateTime'
    normal $
    return
  elseif line =~ '^\d\d:\d\d - '
    exec "normal 07la "
    let extra = ""
  else
    exec "normal 0"
    let extra = " - "
  endif
  exec "normal i\<C-R>=strftime('" . format . "')\<CR>" . extra
  normal $
endfunction

function! s:insertTotal()
  let pos = getpos('.')
  exec "normal Vap"
  exec ":'<,'>CalculateTotal"
  call setpos('.', pos)
endfunction

command! -range CalculateTime <line1>,<line2>call s:calculateTime()
command! -range CalculateTotal <line1>,<line2>call s:calculateTotal()

nnoremap <silent> <Plug>InsertTimestamp :call <SID>insertTimestamp()<CR>
nnoremap <silent> <Plug>InsertTotal :call <SID>insertTotal()<CR>

" This are the default mappings. You can use your own by using the same
" commands below in your vimrc. You may want to remove the <unique> modifier.
nmap <unique> <silent> <leader>t <Plug>InsertTimestamp
vmap <unique> <silent> <leader>t :CalculateTime<CR>
nmap <unique> <silent> <leader>r <Plug>InsertTotal
vmap <unique> <silent> <leader>r :CalculateTotal<CR>
