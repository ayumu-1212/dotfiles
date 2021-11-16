# dotfiles
## dotfilesのclone
```
 $ cd ~ #ホームディレクトリに移動
 $ git clone https://github.com/ayumu-1212/dotfiles.git
```

## vim・tmuxのインストール
```
 $ suto apt install vim
 $ sudo apt install tmux
```

## シンボリックリンク作成
```
 $ ln -s ~/dotfiles/.bashrc ~/.bashrc
 $ ln -s ~/dotfiles/.vimrc ~/.vimrc
 $ ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
```

## .vimrcセッティング
- dein.vim(プラグインパッケージ管理ツール)インストール
```
$ mkdir -p ~/.cache/dein
$ curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
$ sh ./installer.sh ~/.cache/dein
$ rm ./installer.sh
```

- プラグインのインストール
```
 $ vim #vimを起動すると自動でインストール作業が開始される
```

dein.vim引用
https://github.com/Shougo/dein.vim
