if &compatible
 set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
 call dein#begin('~/.cache/dein')

 call dein#add('Shougo/dein.vim')

 " コード補完
 call dein#add('Shougo/neocomplete.vim')
 call dein#add('marcus/rsense')
 call dein#add('Shougo/neocomplcache-rsense')

 " 静的解析
 call dein#add('scrooloose/syntastic')

 " ドキュメント参照
 call dein#add('thinca/vim-ref')
 call dein#add('yuku-t/vim-ref-ri')

 " メソッド定義元へのジャンプ
 call dein#add('szw/vim-tags')

 " 自動で閉じる
 call dein#add('tpope/vim-endwise')

 " 追記
 call dein#add('"vim-scripts/gitv')
 call dein#add('nanotech/jellybeans.vim')
 call dein#add('ctrlpvim/ctrlp.vim')
 call dein#add('slim-template/vim-slim.git')

 " Nerdtree
 call dein#add('scrooloose/nerdtree')

 " ファイルオープンを便利に
 call dein#add('Shougo/unite.vim')
 " Unite.vimで最近使ったファイルを表示できるようにする
 call dein#add('Shougo/neomru.vim')

 " インデントに色を付けて見やすくする
 call dein#add('nathanaelkane/vim-indent-guides')

 " TypeScript
 call dein#add('leafgarland/typescript-vim')

 " Gitを便利に使う
 call dein#add('tpope/vim-fugitive')

 call dein#end()
 call dein#save_state()
endif

" -------------------------------
" Rsense
" -------------------------------
"let g:rsenseHome = '/usr/local/lib/rsense-0.3'
let g:rsenseHome = expand("Users/yusuke_yasuo/.gem/ruby/2.3.0/bin/rsense")
let g:rsenseUseOmniFunc = 1

" --------------------------------
" neocomplete.vim
" --------------------------------
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.ruby = '[^.*\t]\.\w*\|\h\w*::'

" --------------------------------
" rubocop
" --------------------------------
" syntastic_mode_mapをactiveにするとバッファ保存時にsyntasticが走る
" active_filetypesに、保存時にsyntasticを走らせるファイルタイプを指定する
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': ['ruby'] }
let g:syntastic_ruby_checkers = ['rubocop']

" --------------------------------
" vim-indent-guides
" --------------------------------
let g:indent_guides_enable_on_vim_startup = 1

" --------------------------------
" 基本設定
" --------------------------------
" vim内部で使われる文字エンコーディングをutf-8に設定する
set encoding=utf-8

" 想定される改行コードの指定する
set fileformats=unix,dos,mac

" ハイライトを有効化する
syntax enable

" 挿入モードでTABを挿入するとき、代わりに適切な数の空白を使う
set expandtab

" 新しい行を開始したとき、新しい行のインデントを現在行と同じにする
set autoindent

" ファイル形式の検出の有効化する
" ファイル形式別プラグインのロードを有効化する
" ファイル形式別インデントのロードを有効化する
filetype plugin indent on

let g:neobundle#log_filename = $HOME . "/neobundle.log"

"追記
"Plugin  'gitv'
"Plugin 'nanotech/jellybeans.vim'
"Plugin 'ctrlpvim/ctrlp.vim'
"Plugin 'slim-template/vim-slim.git'


"追記
syntax on 
colorscheme jellybeans
set tabstop=2
set softtabstop=2
set shiftwidth=2
augroup fileTypeIndent
    autocmd!
    autocmd BufNewFile,BufRead *.php setlocal tabstop=4 softtabstop=4 shiftwidth=4
    autocmd BufNewFile,BufRead *.py setlocal tabstop=4 softtabstop=4 shiftwidth=4
    autocmd BufNewFile,BufRead *.html setlocal tabstop=4 softtabstop=4 shiftwidth=4
augroup END
set autoindent
set smartindent
set cursorline
"highlight CursorLine term=reverse cterm=reverse
set cursorcolumn
"highlight CursorColumn term=reverse cterm=reverse
set number
set hlsearch
set paste
set list
set listchars=tab:>-,trail:-
set expandtab

" grep検索の実行後にQuickFix Listを表示する
autocmd QuickFixCmdPost *grep* cwindow

" ステータス行に現在のgitブランチを表示する
set statusline+=%{fugitive#statusline()}

nnoremap <silent><C-e> :NERDTreeToggle<CR>
