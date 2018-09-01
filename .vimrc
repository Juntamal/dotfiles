call plug#begin('~/.vim/plugged')

Plug 'ryanoasis/vim-devicons'
Plug 'terryma/vim-multiple-cursors'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'VundleVim/Vundle.vim'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-git'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-rvm'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-fugitive'
Plug 'skwp/vim-rspec'
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
" Plug 'itchyny/lightline.vim'
Plug 'cohama/lexima.vim'

"colorscheme
Plug 'tpope/vim-vividchalk'
Plug 'morhetz/gruvbox'
Plug 'sjl/badwolf'

call plug#end()

" ファイル形式の検出
filetype on

" Visualmode 調整
autocmd ColorScheme gruvbox highlight Visual cterm=bold ctermbg=237 ctermfg=NONE

" 文字コードの設定
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set guifont=Cica:h16
set printfont=Cica:h12
set ambiwidth=double

" TABキーを押した際にタブ文字の代わりにスペースを入れる
set expandtab
set tabstop=2
set shiftwidth=2
set smarttab " 行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする

" 常にステータスラインを表示
set laststatus=2

" 検索時、大文字から始めたら大文字小文字を無視しない
set smartcase

" エラーベルを鳴らさない
set noerrorbells

" バックアップファイルを作らない
set nobackup
set noswapfile

" バッファを切り替えてもundoの効果を失わないようにする
set hidden

" 行数を表示する
set number

" ステータスバーを下から2行目に表示
set ruler

" deleteが効かない問題の修正
set backspace=indent,eol,start

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

" 検索
set hlsearch
set ignorecase
set incsearch " インクリメンタルサーチ. １文字入力毎に検索を行う
set ignorecase " 検索パターンに大文字小文字を区別しない
set smartcase " 検索パターンに大文字を含んでいたら大文字小文字を区別する
set hlsearch " 検索結果をハイライト
" ESCキー2度押しでハイライトの切り替え
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>

" クリップボード
set clipboard=unnamed,autoselect

" Insertからを早く
set ttimeoutlen=50

" シンタックスハイライトを有効化する
syntax on

" colorscheme
" colorscheme vividchalk
set t_Co=256
" colorscheme badwolf
let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox

" フォルダアイコンの表示をON
let g:WebDevIconsUnicodeDecorateFolderNodes = 1

" vモードの置換連続ペースト用
function! Put_text_without_override_register()
  let line_len = strlen(getline('.'))
  execute "normal! `>"
  let col_loc = col('.')
  execute 'normal! gv"_x'
  if line_len == col_loc
    execute 'normal! p'
  else
    execute 'normal! P'
  endif
endfunction
xnoremap <silent> p :call Put_text_without_override_register()<CR>

set clipboard=unnamed "ヤンクした時に自動でクリップボードにコピー(autoselectを指定するとvモードの置換連続ペーストができない)

" let g:lightline = {
"             \ 'colorscheme': 'jellybeans',
"             \ 'active': {
"             \   'left': [ [ 'mode', 'paste' ],
"             \             [ 'fugitive', 'filename' ] ]
"             \ },
"             \ 'component_function': {
"             \   'fugitive': 'LightLineFugitive',
"             \   'readonly': 'LightLineReadonly',
"             \   'modified': 'LightLineModified',
"             \   'filename': 'LightLineFilename',
"             \   'filetype': 'LightLineFiletype',
"             \   'fileformat': 'LightLineFileformat',
"             \ },
"             \ 'separator': { 'left': '', 'right': '' },
"             \ 'subseparator': { 'left': '', 'right': '' }
"             \ }
"
" function! LightLineModified()
"     if &filetype == "help"
"         return ""
"     elseif &modified
"         return "+"
"     elseif &modifiable
"         return ""
"     else
"         return ""
"     endif
" endfunction
"
" function! LightLineReadonly()
"     if &filetype == "help"
"         return ""
"     elseif &readonly
"         return ""
"     else
"         return ""
"     endif
" endfunction
"
" function! LightLineFugitive()
"     if exists("*fugitive#head")
"         let _ = fugitive#head()
"         return strlen(_) ? ''._ : ''
"     endif
"     return ''
" endfunction
"
" function! LightLineFilename()
"     return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
"                 \ ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
"                 \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
" endfunction
"
" function! LightLineFiletype()
"   return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
" endfunction
"
" function! LightLineFileformat()
"   return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
" endfunction
"
" " let g:lightline.tabline = {
" "   \   'left': [ ['tabs'] ],
" "   \   'right': [ ['close'] ]
" "   \ }
" set showtabline=2  " Show tabline


"airline
let g:airline_theme ='dracula'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_format = {
	\ '0': '0 ',
	\ '1': '1 ',
	\ '2': '2 ',
	\ '3': '3 ',
	\ '4': '4 ',
	\ '5': '5 ',
	\ '6': '6 ',
	\ '7': '7 ',
	\ '8': '8 ',
	\ '9': '9 '
	\}
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'
" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''


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

" ctrlp
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" indentLine
" let g:indentLine_color_term = 1
" let g:indentLine_color_gui = '#708090'
" let g:indentLine_char = '|'
"neocomplcache周りの設定
let g:neocomplcache_enable_at_startup=1
let g:neocomplcache_enable_smart_case=1
let g:neocomplcache_enable_camel_case_completion=1
let g:neocomplcache_enable_underbar_completion=1
let g:neocomplcache_min_syntax_length=3

" Default mapping
let g:multi_cursor_start_word_key      = '<C-n>'
let g:multi_cursor_select_all_word_key = '<A-n>'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

" NERDTree ---------------------------------------------------------------------
nmap <C-\> :NERDTreeToggle<cr>
map <silent> <leader>d :execute 'NERDTreeToggle ' . getcwd()<CR>

autocmd StdinReadPre * let s:std_in=1
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.DS_Store$']
let g:NERDTreeWinSize=45
let g:NERDTreeAutoDeleteBuffer=1
" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('rb', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('js', 'Magenta', 'none', '#ffa500', '#151515')

" save
nmap <Space>w :w<CR>
nmap <Space>q :q<CR>
nmap <Space>q :q<CR>
nmap <Space>z <C-z>
nmap <Space>e :e!<CR>

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
" inoremap { {}<Left>
" inoremap [ []<LEFT>
" inoremap ( ()<LEFT>
" inoremap " ""<LEFT>
" inoremap ' ''<LEFT>
" inoremap {<Enter> {}<Left><CR><ESC><S-o>
" inoremap (<Enter> ()<Left><CR><ESC><S-o>

""""""""""""""""""""""""""""""
" 全角スペースの表示
""""""""""""""""""""""""""""""
function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
endfunction

if has('syntax')
    augroup ZenkakuSpace
        autocmd!
        autocmd ColorScheme * call ZenkakuSpace()
        autocmd VimEnter,WinEnter,BufRead * let w:m1=matchadd('ZenkakuSpace', '　')
    augroup END
    call ZenkakuSpace()
endif
""""""""""""""""""""""""""""""

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
