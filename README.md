# プログラミング基礎講座

- 場所：大手町パークビル

- 日程：20190703, 20190710, 20190717, 20190724

## 環境

```
Python: 3.7.2
OS: Windows10
```

## 参考URL

### VSCode

  無料で開発環境を用意してくれる Microsoft の製品。

  <=== 公式 ===>

  https://code.visualstudio.com/

### WinPython

  Windows OS で管理者権限なしで Python の環境構築ができる。

  <=== 公式 ===>

  https://winpython.github.io/

  <=== 参考 ===>

  https://algorithm.joho.info/programming/python/winpython/

## 第 1 回 20190703 Python環境構築とサンプルプログラム

- 事前準備

  * 講義用の `mec_lecture` というフォルダ (=ディレクトリ) をDesktop上に作る
  * VSCode をダウンロードする ( https://code.visualstudio.com/ )
  * WinPython をダウンロードして、 `mec_lecture` フォルダに保存する ( https://winpython.github.io/ )
  * WinPython-64bit-3.7.2.exe を実行する

- WinPython Command Prompt.exe を開いて、先ほど作成したディレクトリに移動する

  ```bash
  <!-- 一つ上の階層に移動する -->
  $ cd ..

  <!-- ディレクトリを作る -->
  $ mkdir lecture_1

  <!-- 移動する -->
  $ cd lecture_1

  <!-- Python のバージョン確認 -->
  $ python -V

  <!-- ファイルを作る -->
  $ New-Item test.py
  ```

- VSCode を立ち上げて `mec_lecture` ディレクトリを開く

- test.py ファイルを更新して実行する

  ```bash
  $ python test.py
  ```

- 今後のために Google Chrome をダウンロードしましょう ( https://www.google.co.jp/chrome/ )

- Google Chrome をデフォルトのブラウザとして使う ( https://www.atmarkit.co.jp/ait/articles/1508/05/news031.html )

- Google Chrome のアイコンをタスクバーにピン留めしましょう

## 第 2 回 20190710 Pythonを使ってデータ分析をしてみる

- `mec_lecture/lecture_2` の `README.md` を参照

## 第 3 回 20190717 三菱地所の物件データをWebsiteから取得する

- `mec_lecture/lecture_3` の `README.md` を参照

## 第 4 回 20190724 三菱地所の物件データを地図で分析してみる

- `mec_lecture/lecture_4` の `README.md` を参照
