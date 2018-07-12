let s:dein_dir = expand('~/.cache/dein')
" dein.vim 本体
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vim がなければ github から落としてくる
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" 設定開始
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " プラグインリストを収めた TOML ファイル
  " 予め TOML ファイル（後述）を用意しておく
  let g:rc_dir    = expand('~/.vim/rc')
  let s:toml      = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

  " TOML を読み込み、キャッシュしておく
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  " 設定終了
  call dein#end()
  call dein#save_state()
endif

" もし、未インストールものものがあったらインストール
if dein#check_install()
  call dein#install()
endif
filetype plugin indent on
filetype indent on
syntax on
set backspace=indent,eol,start


" Python
"" jediでdocstringは表示しない
autocmd FileType python setlocal completeopt-=preview
"" quickrunのマップと衝突するためコマンド作成
command! -nargs=0 JediRename :call jedi#rename()
let g:jedi#rename_command = ""
"" neocomplete共存設定
autocmd FileType python setlocal omnifunc=jedi#completions
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
if !exists('g:neocomplete#force_omni_input_patterns')
        let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.python = '\h\w*\|[^. \t]\.\w*'

"molokaiの設定
colorscheme molokai
set t_Co=256k

" 全時代的なスクリーンベルを無効化
set t_vb = 
set novisualbell
set belloff=all

"その他の設定
set wildmenu "コメンドモードの補完
set history=5000
set whichwrap=b,s,h,l,<,>,[,],~ " カーソルの左右移動で行末から次の行の行頭への移動が可能になる
set number " 行番号を表示
set cursorline " カーソルラインをハイライト
set title
set ruler
set nowrap
set showmatch
set matchtime=3
set wrapscan
set autoindent
set pumheight=10
set expandtab " タブ入力を複数の空白入力に置き換える
set tabstop=4 " 画面上でタブ文字が占める幅
set softtabstop=4 " 連続した空白に対してタブキーやバックスペースキー
set autoindent " 改行時に前の行のインデントを継続する
set pumheight=10
set textwidth =0
set smartindent " 改行時に前の行の構文をチェックし次の行のインデントを増減する
set shiftwidth=4 " smartindentで増減する幅
set virtualedit=all
set nowritebackup
set nobackup
set noswapfile
syntax enable
" 検索系
set incsearch " インクリメンタルサーチ. １文字入力毎に検索を行う
set ignorecase " 検索パターンに大文字小文字を区別しない
set smartcase " 検索パターンに大文字を含んでいたら大文字小文字を区別する
set hlsearch " 検索結果をハイライト
set colorcolumn=80
set laststatus=2
set encoding=utf-8
scriptencoding utf-8
inoremap jj <ESC>

" 移動系の設定
nnoremap n nzz
nnoremap N Nzz
noremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz
nnoremap j gj
nnoremap k gk
vnoremap v $h
nnoremap <down> gj
nnoremap <up> gk
nnoremap Y y
nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)

" ---------- Python設定 ----------
autocmd FileType python setlocal smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
" 改行時自動インデントする宣言
let python_highlight_all =1 " Python用のシンタックスハイライトを全てONに

