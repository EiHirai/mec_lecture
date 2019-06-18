# プログラミング基礎講座

- 場所：大手町パークビル

- 日程：20190703, 20190710, 20190717, 20190724

- 参考文献：プロを目指す人のための Ruby 入門 ( https://ruby-book.jnito.com/ )

## 環境

```
ruby: 2.4.6
rails: 5.2.3
sqlite: 3.28.0
OS: Windows10
```

## 環境構築手順

- VSCode
  https://code.visualstudio.com/

- Ruby 公式
  https://www.ruby-lang.org/ja/

- Ruby on Rails ガイド
  https://railsguides.jp/

- 参考にしたサイト
  https://qiita.com/masakinihirota/items/ec90086bab86f369fa15

  https://azumayuri.hatenablog.com/entry/2018/08/08/034005

  https://eng-entrance.com/cmd-usage

- Rails tutorial
  https://railstutorial.jp/

### Ruby と SQLite のインストール

- https://rubyinstaller.org/downloads/ にアクセスして、"Ruby+Devkit 2.4.6-1 (x64)"をインストール

- https://www.sqlite.org/download.html にアクセスして、"sqlite-dll-win64-x64-3280000.zip"と"sqlite-tools-win32-x86-3280000.zip"を解凍して、中身を全て`C:\Ruby26-x64\bin`に入れる

- Start Command Prompt with Ruby を起動して、`$ ruby -v`, `$ sqlite3 --version`と入力してインストールされているか確認する

### Ruby on Rails のインストール

- Start Command Prompt with Ruby で、`$ gem install bundler`, `$ bundler --version`

- `$ rails -v`でバージョン確認

- `$ gem install rails -v 5.2.3`

## 第 1 回 20190703 環境構築とサンプルプログラム

- Start Command Prompt with Ruby を起動して`$ puts("Hello, world")`

## 第 2 回 20190710 データ分析をしてみる

- Start Command Prompt with Ruby を起動して`$ gem install daru`

- スタートメニューから Interactive Ruby を起動する

## 第 3 回 20190717 Ruby on Rails で WEB アプリを作ってみる ①

- `https://railstutorial.jp/`にアクセスする

- `rails new mec-app`でアプリを作る

## 第 4 回 20190724 Ruby on Rails で WEB アプリを作ってみる ②
