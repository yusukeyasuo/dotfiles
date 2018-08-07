" -------------------------------
" NeoBundle
" -------------------------------
if has('vim_starting')
  if &compatible
    set nocompatible
  endif

  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle'))

NeoBundleFetch 'Shougo/neobundle.vim'

" コード補完
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'marcus/rsense'
"NeoBundle 'supermomonga/neocomplete-rsense.vim'
NeoBundle 'Shougo/neocomplcache-rsense'

" 静的解析
NeoBundle 'scrooloose/syntastic'

" ドキュメント参照
NeoBundle 'thinca/vim-ref'
NeoBundle 'yuku-t/vim-ref-ri'

" メソッド定義元へのジャンプ
NeoBundle 'szw/vim-tags'

" 自動で閉じる
NeoBundle 'tpope/vim-endwise'

" 追記
NeoBundle 'gitv'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'slim-template/vim-slim.git'

" Nerdtree
NeoBundle 'scrooloose/nerdtree'

" ファイルオープンを便利に
NeoBundle 'Shougo/unite.vim'
" Unite.vimで最近使ったファイルを表示できるようにする
NeoBundle 'Shougo/neomru.vim'

" インデントに色を付けて見やすくする
NeoBundle 'nathanaelkane/vim-indent-guides'

" TypeScript
NeoBundle 'leafgarland/typescript-vim'

" Gitを便利に使う
NeoBundle 'tpope/vim-fugitive'

call neobundle#end()

NeoBundleCheck

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
