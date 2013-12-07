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


"=============================================================================
function! s:_get_leftline(cmdline) "{{{
  return strpart(a:cmdline, 0, getcmdpos()-1)
endfunction
"}}}
function! s:_get_rightline(cmdline) "{{{
  return strpart(a:cmdline, getcmdpos()-1)
endfunction
"}}}

"=============================================================================
"END "{{{1
let &cpo = s:save_cpo| unlet s:save_cpo
