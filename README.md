#cmdlineplus.vim
コマンドラインを改造するキーマッピングを提供する

##概要
*cmdlineplus* はコマンドラインに使える幾つかのキーマッピングを提供します。最新版:  
https://github.com/LeafCage/cmdlineplus.vim  


##使い方
キーマッピングを定義して下さい。  
例:  

```vim
cmap <C-g> <Plug>(cmdlineplus-forward-word)
cmap <C-b> <Plug>(cmdlineplus-backward-word)
cmap <C-\><C-k>  <Plug>(cmdlineplus-killline)
cmap <C-\><C-\>  <Plug>(cmdlineplus-escape-special)
cmap <C-\>i  <Plug>(cmdlineplus-escape-input)
cmap <C-\><C-y>  <Plug>(cmdlineplus-yank)
cmap <C-\><C-c>  <Plug>(cmdlineplus-yank-clipboard)
```
