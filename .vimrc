call plug#begin('~/.vim/plugged')

Plug 'VundleVim/Vundle.vim'
Plug 'tpope/vim-vividchalk'
Plug 'morhetz/gruvbox'
Plug 'sjl/badwolf'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-git'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-rvm'
Plug 'tpope/vim-haml'
Plug 'skwp/vim-rspec'
Plug 'tpope/vim-rails'
Plug 'tomtom/tcomment_vim'
Plug 'Shougo/neocomplcache'
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimfiler'
Plug 'scrooloose/nerdtree'
Plug 'bronson/vim-trailing-whitespace'
Plug 'h1mesuke/unite-outline'
Plug 'vim-ruby/vim-ruby'
Plug 'othree/html5.vim'
Plug 'slim-template/vim-slim', { 'for': 'slim' }
Plug 'hail2u/vim-css3-syntax'
Plug 'scrooloose/nerdtree'
Plug 'pangloss/vim-javascript'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

" 文字コードの設定
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
" 常にステータスラインを表示
set laststatus=2
" 検索文字のハイライト
set hlsearch
" 検索時、大文字小文字無視
set ignorecase
" 検索時、大文字から始めたら大文字小文字を無視しない
set smartcase
" タブ文字の表示幅
set tabstop=2
" Vimが挿入するインデントの幅
set shiftwidth=2
" 行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする
set smarttab
" ファイル形式の検出
filetype on
" ファイル形式別のインデントを有効にする
" ファイル形式別のプラグインを有効にする
filetype plugin indent on

" エラーベルを鳴らさない
set noerrorbells

" バックアップファイルを作らない
set nobackup

" バッファを切り替えてもundoの効果を失わないようにする
set hidden
" 行数を表示する
set number
" ステータスバーを下から2行目に表示
set laststatus=2
" カーソル位置を表示する
set ruler

" 自動インデントを有効にする
set autoindent
" コマンドラインモードで<Tab>キーによるファイル名補完を有効にする
set wildmenu
" 入力中のコマンドを表示する
set showcmd
" タブと行の続きを可視化する
set listchars=tab:>\ ,extends:<
" 対応する括弧やブレースを表示する
set showmatch

" シンタックスハイライトを有効化する
syntax on

" vividchalk as colorscheme
" colorscheme vividchalk
set t_Co=256
colorscheme badwolf

let ruby_space_errors=1
let g:rubycomplete_buffer_loading=1
let g:rubycomplete_classes_in_global=1
let g:rubycomplete_rails=1
let g:rails_level=4
let g:rails_syntax=1

let g:javascript_plugin_flow = 1

"バッファタブにパスを省略してファイル名のみ表示する(buftabs.vim)
let g:buftabs_only_basename=1
"バッファタブをステータスライン内に表示する
let g:buftabs_in_statusline=1

"neocomplcache周りの設定
let g:neocomplcache_enable_at_startup=1
let g:neocomplcache_enable_smart_case=1
let g:neocomplcache_enable_camel_case_completion=1
let g:neocomplcache_enable_underbar_completion=1
let g:neocomplcache_min_syntax_length=3

" NERDTree
let mapleader = ","
nmap <leader>ne :NERDTree<cr>

" save
nmap <Space>w :w<CR>
nmap <Space>q :q<CR>
nmap <Space>z <C-z>

" Space + hl で:nohl
nmap <Space>hl :nohl<CR>

" ノーマルモードでもエンターキーで改行を挿入
noremap <CR> o<ESC>

" バッファの移動を矢印キーで
map <LEFT> <ESC>:bp<CR>
map <RIGHT> <ESC>:bn<CR>
map <UP> <ESC>:ls<CR>
map <Space>d <ESC>:bd<CR>

" :と数字でバッファ移動
map <ESC>:1 <ESC>:b1

" CTRL-Spaceでomni補完
imap <C-Space> <C-x><C-o>

"CTRL-kでクリップボードから貼り付け
imap <C-k> <ESC>"+gpa

" <ESC> when typing 'jj' quick
inoremap jj <Esc>

" 括弧補完
inoremap { {}<Left>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap (<Enter> ()<Left><CR><ESC><S-o>

" Swap up/down with up/down with display lines
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

function! MagicComment()
  return "# coding: utf-8\<CR>"
endfunction

inoreabbrev <buffer> #### <C-R>=MagicComment()<CR>

" Space + . でvimrcを開く
nnoremap <Space>. :<C-u>edit ~/.vimrc<Enter>

" ;と:を入れ替える
noremap ; :

noremap <Shift>: ;

set listchars=eol:$,tab:>\

autocmd FileType ruby map <F9> :w<CR>:!ruby -c %<CR>


function! Scouter(file, ...)
	let pat = '^\s*$\|^\s*"'
	let lines = readfile(a:file)
	if !a:0 || !a:1
		let lines = split(substitute(join(lines, "\n"), '\n\s*\\', '', 'g'), "\n")
	endif
	return len(filter(lines,'v:val !~ pat'))
endfunction
command! -bar -bang -nargs=? -complete=file Scouter
			\        echo Scouter(empty(<q-args>) ? $MYVIMRC : expand(<q-args>), <bang>0)


function! s:SetupSpeCuke()
	command! RunTestFile exe '!sc ' . expand('%:p')
	command! RunTestCase exe '!sc --line ' . line('.') . ' ' . expand('%:p')

	nnoremap -tf :RunTestFile<CR>
	nnoremap -tc :RunTestCase<CR>
endfunction

au BufRead,BufNewFile *_spec.rb,*.feature call s:SetupSpeCuke()
