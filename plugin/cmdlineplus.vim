cnoremap <Plug>(cmdlineplus-forward-word)  <C-\>ecmdlineplus#forward_word()<CR>
cnoremap <Plug>(cmdlineplus-backward-word)  <C-\>ecmdlineplus#backward_word()<CR>
cnoremap <Plug>(cmdlineplus-killline)   <C-\>ecmdlineplus#killline()<CR>
cnoremap <Plug>(cmdlineplus-escape-special)   <C-\>ecmdlineplus#escape('#%')<CR>
cnoremap <Plug>(cmdlineplus-escape-input)   <C-\>ecmdlineplus#escape(input('input to escape chars: '))<CR>
cnoremap <Plug>(cmdlineplus-yank)  <C-\>ecmdlineplus#yank('"')<CR>
cnoremap <Plug>(cmdlineplus-yank-clipboard)  <C-\>ecmdlineplus#yank('*')<CR>
