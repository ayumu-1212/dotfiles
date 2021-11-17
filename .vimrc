"setting
"基本設定
set encoding=utf-8 " エンコードするときの文字コード
scriptencoding utf-8 " .vimrcの文字コード
set fileencoding=utf-8 " 保存時の文字コード
set fileencodings=ucs-boms,utf-8,euc-jp,cp932 " 読み込み時の文字コードの自動判別. 左側が優先される
set fileformats=unix,dos,mac " 改行コードの自動判別. 左側が優先される
set ambiwidth=double " □や○文字が崩れる問題を解決
set noswapfile " 勝手にswapファイルを開くのを防ぎます
set hidden " バッファ保存せずに移動しようとした場合に!をつけなくても移動できる, またargsの移動も隠しフ ァイルにする

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

set visualbell t_vb=
set noerrorbells "エラーメッセージの表示時にビープを鳴らさない

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
    "call dein#add('Shougo/deoplete.nvim')


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

" 隠しファイルを表示
let NERDTreeShowHidden = 1

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

" デフォルトでツリーを表示させる
let g:nerdtree_tabs_open_on_console_startup=1

" ファイルを閉じるときにvim NERDtreeを閉じる
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" VimのカラースキームをMolokaiに変更
colorscheme molokai

" コマンドを簡単なものにマッピング
" 空コマンド
nnoremap s <Nop>
" 画面間移動 下
nnoremap sj <C-w>j
" 画面間移動 上
nnoremap sk <C-w>k
" 画面間移動 右
nnoremap sl <C-w>l
" 画面間移動 左
nnoremap sh <C-w>h
" 画面自体を移動 下
nnoremap sJ <C-w>J
" 画面自体を移動 上
nnoremap sK <C-w>K
" 画面自体を移動 右
nnoremap sL <C-w>L
" 画面自体を移動 左
nnoremap sH <C-w>H
" 画面の縦幅を 増加
nnoremap s+ <C-w>5+
" 画面の縦幅を 減少
nnoremap s- <C-w>5-
" 画面の横幅を 増加
nnoremap s> <C-w>5>
" 画面の横幅を 減少
nnoremap s< <C-w>5<
" 次のタブへ移動
nnoremap sn gt
" 前のタブへ移動
nnoremap sp gT
" 同じ行数で左右に移動
nnoremap sr <C-w>r
" 次のバッファへ移動
nnoremap sN :<C-u>bn<CR>
" 前のバッファへ移動
nnoremap sP :<C-u>bp<CR>
" タブの新規作成
nnoremap st :<C-u>tabnew<CR>
" 画面を上下に分割
nnoremap ss :<C-u>sp<CR>
" 画面を左右に分割
nnoremap sv :<C-u>vs<CR>
" 画面を閉じる(バッファは残り、保存はしない)
nnoremap sq :<C-u>q<CR>
" 画面を閉じる(バッファも閉じる、保存が必要な場合は有無を聞かれる)
nnoremap sQ :<C-u>sN<CR>

" eを押しながら上下に移動させる
" ref: https://vim.fandom.com/wiki/Moving_lines_up_or_down
inoremap ek <Esc>:m .-2<CR>==gi
inoremap ej <Esc>:m .+1<CR>==gi
vnoremap ek :m '<-2<CR>gv=gv
vnoremap ej :m '>+1<CR>gv=gv
nnoremap ej :m .+1<CR>==
nnoremap ek :m .-2<CR>==

" Ctrl-yのあとに-/=を押すとerbフォーマット挿入
inoremap <C-y>- <%  %><Left><Left><Left>
inoremap <C-y>= <%=  %><Left><Left><Left>


" 行が折り返し表示されていた場合、行単位ではなく表示行単位でカーソルを移動する
noremap j gj
noremap k gk
noremap <down> gj
noremap <up> gk

" ctrl-oで下に空行挿入
nnoremap <C-o> mzo<Esc>"_cc<Esc>`z
