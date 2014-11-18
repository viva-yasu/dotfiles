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

NeoBundle 'Shougo/neobundle.vim'        " NeoBundle
NeoBundle 'Shougo/vimproc'
NeoBundle 'scrooloose/nerdtree'         " NerdTree
NeoBundle 'surround.vim'                " テキストオブジェクト拡張
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'taichouchou2/html5.vim'
NeoBundle 'Townk/vim-autoclose'         " 自動とじ括弧  
NeoBundle 'jelera/vim-javascript-syntax', {'autoload':{'filetypes':['javascript']}} " jsシンタックス 
NeoBundle 'Shougo/neocomplcache'

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

au BufWrite /private/tmp/crontab.* set nowritebackup
au BufWrite /private/etc/pw.* set nowritebackup
" php 辞書ファイル 
autocmd FileType php :set dictionary=~/.vim/dict/php.dict
" js 辞書ファイル
autocmd FileType javascript :set dictionary=~/.vim/dict/javascript.dict,~/.vim/dict/jQuery.dict

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

" NERDTreeのショートカット(Ctrl - e)
nnoremap <silent><C-e> :NERDTreeToggle<CR>

" HTML 5 tags
syn keyword htmlTagName contained article aside audio bb canvas command
syn keyword htmlTagName contained datalist details dialog embed figure
syn keyword htmlTagName contained header hgroup keygen mark meter nav output
syn keyword htmlTagName contained progress time ruby rt rp section time
syn keyword htmlTagName contained source figcaption
syn keyword htmlArg contained autofocus autocomplete placeholder min max
syn keyword htmlArg contained contenteditable contextmenu draggable hidden
syn keyword htmlArg contained itemprop list sandbox subject spellcheck
syn keyword htmlArg contained novalidate seamless pattern formtarget
syn keyword htmlArg contained formaction formenctype formmethod
syn keyword htmlArg contained sizes scoped async reversed sandbox srcdoc
syn keyword htmlArg contained hidden role
syn match   htmlArg "\<\(aria-[\-a-zA-Z0-9_]\+\)=" contained
syn match   htmlArg contained "\s*data-[-a-zA-Z0-9_]\+"


" -----------------------------
" BEGIN NeoComplcache 設定
" -----------------------------

" 起動時に有効 
let g:neocomplcache_enable_at_startup = 1
"ポップアップメニューで表示される候補の数
let g:neocomplcache_max_list = 20
"1:補完候補検索時に大文字・小文字を無視する
let g:neocomplcache_enable_ignore_case = 1
" 自動補完開始のキーワードの長さ
let g:neocomplcache_auto_completion_start_length = 1
" キャメルケースの補完対応
let g:neocomplcache_enable_camel_case_completion = 1
" アンダースコアーの補完対応
let g:neocomplcache_enable_underbar_completion = 1
" 補完リスト追加
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'javascript' : $HOME.'/.vim/dict/javascript.dict'
    \ }
autocmd BufRead *.php\|*.ctp\|*.tpl :set dictionary=~/.vim/dict/php.dict filetype=php
" -----------------------------
" END NeoComplcache 設定
" -----------------------------
