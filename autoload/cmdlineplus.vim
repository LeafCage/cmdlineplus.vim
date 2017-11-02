if exists('s:save_cpo')| finish| endif
let s:save_cpo = &cpo| set cpo&vim
"=============================================================================
function! cmdlineplus#forward_word() "{{{
  let cmdline = getcmdline()
  let rightline = s:_get_rightline(cmdline)
  let rem = rightline=~'^\s*\w' ? matchstr(rightline, '^\s*\w\+') :
    \ rightline=~'^\s*[^[:alnum:]_[:blank:]]' ? matchstr(rightline, '^\s*[^[:alnum:]_[:blank:]]\+') :
    \ ''
  if rem==''
    call setcmdpos(strlen(cmdline)+1)
    return cmdline
  endif
  call setcmdpos(strlen(s:_get_leftline(cmdline)) + strlen(rem)+1)
  return cmdline
endfunction
"}}}
function! cmdlineplus#backward_word() "{{{
  let cmdline = getcmdline()
  let leftline = s:_get_leftline(cmdline)
  let rem = leftline=~'\w\s*$' ? matchstr(leftline, '\w\+\s*$') :
    \ leftline=~'[^[:alnum:]_[:blank:]]\s*$' ? matchstr(leftline, '[^[:alnum:]_[:blank:]]\+\s*$') :
    \ ''
  if rem==''
    call setcmdpos(1)
    return cmdline
  end
  call setcmdpos(strlen(leftline) - strlen(rem)+1)
  return cmdline
endfunction
"}}}
function! cmdlineplus#killline() "{{{
  return s:_get_leftline(getcmdline())
endfunction
"}}}
function! cmdlineplus#escape(chars) "{{{
  return escape(getcmdline(), a:chars)
endfunction
"}}}
function! cmdlineplus#yank(reg) "{{{
  let line = getcmdline()
  call setreg(a:reg, line)
  return line
endfunction
"}}}
function! cmdlineplus#jumpto_char(bind) "{{{
  let cmdline = getcmdline()
  let save_gcr = &gcr
  set gcr=a:block-Cursor-blinkon0
  let c = nr2char(getchar())
  let &gcr = save_gcr
  if c=="\<Esc>"
    return cmdline
  end
  let [s:save_jumpbind, s:save_jumpchar] = [a:bind, c]
  let newpos = s:_get_newpos_to_char(a:bind, c, cmdline)
  if newpos!=-1
    call setcmdpos(newpos)
  end
  return cmdline
endfunction
"}}}
function! cmdlineplus#jumpto_next(bind) "{{{
  let cmdline = getcmdline()
  if !has_key(s:, 'save_jumpbind')
    return cmdline
  end
  let bind = a:bind==',' ? tr(s:save_jumpbind, 'ftFT', 'FTft') : s:save_jumpbind
  let newpos = s:_get_newpos_to_char(bind, s:save_jumpchar, cmdline)
  if newpos!=-1
    call setcmdpos(newpos)
  end
  return cmdline
endfunction
"}}}
function! cmdlineplus#delto_char(bind) "{{{
  let cmdline = getcmdline()
  let save_gcr = &gcr
  set gcr=a:hor50-Cursor-blinkon0
  let c = nr2char(getchar())
  let &gcr = save_gcr
  if c=="\<Esc>"
    return cmdline
  end
  let newpos = s:_get_newpos_to_char(a:bind, c, cmdline)
  if newpos==-1
    return cmdline
  end
  let pos = getcmdpos()-1
  if pos==newpos
    return cmdline
  elseif pos<newpos
    return cmdline[:(pos-1)] . cmdline[(newpos-1):]
  else
    call setcmdpos(newpos)
    return cmdline[:(newpos-2)]. cmdline[(pos):]
  end
endfunction
"}}}


"=============================================================================
function! s:_get_leftline(cmdline) "{{{
  return strpart(a:cmdline, 0, getcmdpos()-1)
endfunction
"}}}
function! s:_get_rightline(cmdline) "{{{
  return strpart(a:cmdline, getcmdpos()-1)
endfunction
"}}}
function! s:_get_newpos_to_char(bind, c, cmdline) "{{{
  if a:bind=~#'\l'
    let rightline = s:_get_rightline(a:cmdline)
    let idx = stridx(rightline, a:c)
    let newpos = getcmdpos() + idx + (a:bind==#'f' ? 1 : 0)
  else
    let leftline = s:_get_leftline(a:cmdline)
    let idx = strridx(leftline, a:c)
    let newpos = idx + (a:bind==#'F' ? 1 : 2)
  end
  if idx==-1
    return -1
  else
    return newpos
  end
endfunction
"}}}

"=============================================================================
"END "{{{1
let &cpo = s:save_cpo| unlet s:save_cpo
