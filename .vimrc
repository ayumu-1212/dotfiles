"setting
"基本設定
set encoding=utf-8
scriptencoding utf-8
set fileencoding=utf-8 " 保存時の文字コード
set fileencodings=ucs-boms,utf-8,euc-jp,cp932 " 読み込み時の文字コードの自動判別. 左側が優先される
set fileformats=unix,dos,mac " 改行コードの自動判別. 左側が優先される
set ambiwidth=double " □や○文字が崩れる問題を解決
set noswapfile " 勝手にswapファイルを開くのを防ぎます
set hidden " バッファ保存せずに移動しようとした場合に!をつけなくても移動できる, またargsの移動も隠しファイルにする

set expandtab " タブ入力を複数の空白入力に置き換える
set tabstop=2 " 画面上でタブ文字が占める幅
set softtabstop=2 " 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set autoindent " 改行時に前の行のインデントを継続する
set smartindent " 改行時に前の行の構文をチェックし次の行のインデントを増減する
set shiftwidth=2 " smartindentで増減する幅

set incsearch " インクリメンタルサーチ. １文字入力毎に検索を行う
set ignorecase " 検索パターンに大文字小文字を区別しない
set smartcase " 検索パターンに大文字を含んでいたら大文字小文字を区別する
set hlsearch " 検索結果をハイライト

set nobackup " バックアップファイルを作成しない

set visualbell " ビープ音をすべて視覚表示(ビジュアルベル)に置き換える

set showcmd " 入力中のコマンドを右下に表示する

set number " 行番号を表示
set cursorline " カーソルラインをハイライト

set virtualedit=onemore " カーソルを行末の一つ先まで移動可能にする

set showmatch " 括弧の対応関係を一瞬表示する
set matchtime=1 " 括弧の対応関係を表示する時間を0.1秒にする

set wildmode=list:longest " tabを押したときに共通部分までの補完を行い、候補のリストを表示する

syntax enable " 構文に対して色がつく。またカラースキームを導入可能

" 検索結果をハイライトして、その後ESC2回押しで消せる
nmap <Esc><Esc> :nohlsearch<CR><Esc>

"dein Scripts-----------------------------
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=$HOME/.cache/dein/repos/github.com/Shougo/dein.vim

  " Required:
  if dein#load_state('$HOME/.cache/dein')
    call dein#begin('$HOME/.cache/dein')

    " Let dein manage dein
    " Required:
    call dein#add('$HOME/.cache/dein/repos/github.com/Shougo/dein.vim')

    " Add or remove your plugins here:
    "call dein#add('Shougo/neosnippet.vim')
    "call dein#add('Shougo/neosnippet-snippets')

    " You can specify revision/branch/tag.
    "call dein#add('Shougo/deol.nvim', { 'rev': '01203d4c9' })

    " NERDTree
    call dein#add("scrooloose/nerdtree")

    " NERDTreeにタブ機能を追加
    call dein#add('jistr/vim-nerdtree-tabs')

    " nerdtreeにアイコン表示
    " call dein#add('ryanoasis/vim-devicons')

    " カラースキームmolokai
    call dein#add("tomasr/molokai")

    " コメントアウトショートカット導入 gcc
    call dein#add('tomtom/tcomment_vim')

    " 無駄なスペースをハイライト
    call dein#add('bronson/vim-trailing-whitespace')

    " インデントを可視化する
    call dein#add("Yggdroot/indentLine")

    " 閉じカッコ補完
    call dein#add('cohama/lexima.vim')

    " vim help日本語化
    call dein#add('vim-jp/vimdoc-ja')

    " 非同期補完導入
    call dein#add('Shougo/deoplete.nvim')

    if !has('nvim')
      call dein#add('roxma/nvim-yarp')
      call dein#add('roxma/vim-hug-neovim-rpc')
    endif

    " Required:
    call dein#end()
    call dein#save_state()
  endif

  " Required:
  filetype plugin indent on
  syntax enable

  " If you want to install not installed plugins on startup.
  if dein#check_install()
    call dein#install()
  endif

"End dein Scripts-------------------------

"NERDTree
autocmd vimenter * NERDTree
map <C-n> :NERDTreeToggle<CR>

" Ctrl-nでNERDTreeを起動
noremap <C-n> :<C-u>NERDTreeToggle<CR>

" フォルダアイコンの表示をON
" let g:WebDevIconsUnicodeDecorateFolderNodes = 1

" deoplete.nvimの設定
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete_delay = 0

augroup MyXML
  autocmd!
  autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o><ESC><<<S-a>
  autocmd Filetype html inoremap <buffer> </ </<C-x><C-o><ESC><<<S-a>
  autocmd Filetype eruby inoremap <buffer> </ </<C-x><C-o><ESC><<<S-a>
augroup END

" $B%G%U%)%k%H$G%D%j!<$rI=<($5$;$k(B
let g:nerdtree_tabs_open_on_console_startup=1

" $BB>$N%P%C%U%!$r$9$Y$FJD$8$?;~$K(BNERDTree$B$,3+$$$F$$$?$i(BNERDTree$B$b0l=o$KJD$8$k!#(B
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"molokai$B$N%+%i!<%F!<%^(B
colorscheme molokai

"$B2hLLJ,3d$K4X$9$k%7%g!<%H%+%C%H(B
nnoremap s <Nop>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
nnoremap sn gt
nnoremap sp gT
nnoremap sr <C-w>r
nnoremap s= <C-w>=
nnoremap sw <C-w>w
nnoremap so <C-w>_<C-w>|
nnoremap sO <C-w>=
nnoremap sN :<C-u>bn<CR>
nnoremap sP :<C-u>bp<CR>
nnoremap st :<C-u>tabnew<CR>
nnoremap sT :<C-u>Unite tab<CR>
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap sq :<C-u>q<CR>
nnoremap sQ :<C-u>bd<CR>
nnoremap sb :<C-u>Unite buffer_tab -buffer-name=file<CR>
nnoremap sB :<C-u>Unite buffer -buffer-name=file<CR>


" ctrl+y -/= $B$G(Berb$B$N%+%C%3$rI=<((B
inoremap <C-y>- <%  %><Left><Left><Left>
inoremap <C-y>= <%=  %><Left><Left><Left>


" 行が折り返し表示されていた場合、行単位ではなく表示行単位でカーソルを移動する
noremap j gj
noremap k gk
noremap <down> gj
noremap <up> gk

" ctrl-oで下に空行挿入
nnoremap <C-o> mzo<Esc>"_cc<Esc>`z


