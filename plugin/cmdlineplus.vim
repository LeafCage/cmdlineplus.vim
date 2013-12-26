if exists('g:loaded_cmdlineplus')| finish| endif| let g:loaded_cmdlineplus = 1
let s:save_cpo = &cpo| set cpo&vim
"=============================================================================
cnoremap <Plug>(cmdlineplus-forward-word)  <C-\>ecmdlineplus#forward_word()<CR>
cnoremap <Plug>(cmdlineplus-backward-word)  <C-\>ecmdlineplus#backward_word()<CR>
cnoremap <Plug>(cmdlineplus-killline)   <C-\>ecmdlineplus#killline()<CR>
cnoremap <Plug>(cmdlineplus-escape-special)   <C-\>ecmdlineplus#escape('#%')<CR>
cnoremap <Plug>(cmdlineplus-escape-input)   <C-\>ecmdlineplus#escape(input('input chars to escape: '))<CR>
cnoremap <Plug>(cmdlineplus-yank)  <C-\>ecmdlineplus#yank('"')<CR>
cnoremap <Plug>(cmdlineplus-yank-clipboard)  <C-\>ecmdlineplus#yank('*')<CR>
cnoremap <silent><Plug>(cmdlineplus-f)  <C-\>ecmdlineplus#jumpto_char('f')<CR>
cnoremap <silent><Plug>(cmdlineplus-F)  <C-\>ecmdlineplus#jumpto_char('F')<CR>
cnoremap <silent><Plug>(cmdlineplus-t)  <C-\>ecmdlineplus#jumpto_char('t')<CR>
cnoremap <silent><Plug>(cmdlineplus-T)  <C-\>ecmdlineplus#jumpto_char('T')<CR>
cnoremap <Plug>(cmdlineplus-;)  <C-\>ecmdlineplus#jumpto_next(';')<CR>
cnoremap <Plug>(cmdlineplus-,)  <C-\>ecmdlineplus#jumpto_next(',')<CR>
cnoremap <silent><Plug>(cmdlineplus-df)  <C-\>ecmdlineplus#delto_char('f')<CR>
cnoremap <silent><Plug>(cmdlineplus-dF)  <C-\>ecmdlineplus#delto_char('F')<CR>
cnoremap <silent><Plug>(cmdlineplus-dt)  <C-\>ecmdlineplus#delto_char('t')<CR>
cnoremap <silent><Plug>(cmdlineplus-dT)  <C-\>ecmdlineplus#delto_char('T')<CR>
"=============================================================================
"END "{{{1
let &cpo = s:save_cpo| unlet s:save_cpo
