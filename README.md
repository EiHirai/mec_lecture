# プログラミング基礎講座

- 場所：大手町パークビル

- 日程：20190703, 20190710, 20190717, 20190724

## 環境

```
Python: 3.6.5
Node.js: ***
Nuxt.js: ***
OS: Windows10
```

## 参考URL

### VSCode

  無料で開発環境を用意してくれる Microsoft の製品。

  <=== 公式 ===>

  https://code.visualstudio.com/

### Anaconda3

  データ分析等を行う際の標準言語である Python の仮想環境を手軽に作れる。

  <=== 公式 ===>

  https://www.anaconda.com/distribution/

  <=== 参考 ===>

  http://www.ipcorp.co.jp/dcms_media/other/Python_env_win10.pdf

  https://qiita.com/kaizen_nagoya/items/7bfd7ecdc4e8edcbd679

### Node.js

  スケーラブルなネットワークアプリケーションを構築するために設計された非同期型のイベント駆動の JavaScript 環境。

  <=== 公式 ===>

  https://nodejs.org/ja/

  <=== 参考 ===>

  https://qiita.com/Masayuki-M/items/840a997a824e18f576d8

### Nuxt.js

  Webアプリケーションを手軽に作れるフレームワーク。

  <=== 公式 ===>

  https://ja.nuxtjs.org

  <=== 参考 ===>

  https://arakan-pgm-ai.hatenablog.com/entry/2019/05/17/000000

## 第 1 回 20190703 Python環境構築とサンプルプログラム

- 事前準備

  * 講義用の"mec_lec"というフォルダ (=ディレクトリ) をDesktop上に作る
  * VSCodeをダウンロードする ( https://code.visualstudio.com/ )
  * Anaconda3をダウンロードする ( https://www.anaconda.com/distribution/ )

- VSCodeのPowershellを開いて、先ほど作成したディレクトリに移動する

  ```bash
  <!-- 移動する -->
  $ cd mec_lec

  <!-- ディレクトリを作る -->
  $ mkdir lecture_1

  <!-- 移動する -->
  $ cd lecture_1

  <!-- Python のバージョン確認 -->
  $ python -V

  <!-- ファイルを作る -->
  $ New-Item test.py
  ```

- test.pyファイルを更新して実行する

  ```bash
  $ python test.py
  ```

## 第 2 回 20190710 Pythonを使ってデータ分析をしてみる

### 準備

- 事前準備

  ```bash
  $ mkdir lecture_2
  $ cd lecture_2
  ```

- 分析に使うCSVをダウンロードする

  https://www.citibikenyc.com/system-data

### 分析

- jupyter notebook を起動する

  ```bash
  $ jupyter notebook
  ```

## 第 3 回 20190717 Node.jsとNuxt.jsの環境構築とサンプルアプリを立ち上げる

## 第 4 回 20190724 Nuxt.jsでサンプルを更新してオリジナルアプリを作る
