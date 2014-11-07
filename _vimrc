"====================
" START NeoBundle設定
" NeoBundleInstall  プラグイン新規追加時のインストール
" NeoBundleInstall! プラグインの更新
" NeoBundleClean    プラグインの削除
"====================
set nocompatible	" Use Vim defaults instead of 100% vi compatibility
filetype off
filetype plugin indent off
 
set runtimepath+=~/.vim/bundle/neobundle.vim
call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundle 'Shougo/neobundle.vim'        "NeoBundle
NeoBundle 'scrooloose/nerdtree'         " NerdTree

call neobundle#end()

filetype plugin indent on     "最後にplugin onにしておく。必須！
"====================
" END NeoBundle設定
"====================

" Configuration file for vim
set modelines=0		" CVE-2007-2438

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set backspace=2		" more powerful backspacing

" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup
colorscheme molokai
syntax on
set number
set tabstop=2
set shiftwidth=2
set expandtab
set cursorline
set cmdheight=3
set showmatch
" 対応括弧に<と>のペアを追加
set matchpairs& matchpairs+=<:>
".swapファイルを作らない"
set noswapfile
set encoding=utf-8

" :e などでファイルを開く際にフォルダが存在しない場合は自動作成
function! s:mkdir(dir, force)
  if !isdirectory(a:dir) && (a:force ||
        \ input(printf('"%s" does not exist. Create? [y/N]', a:dir)) =~? '^y\%[es]$')
    call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
  endif
endfunction
