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

- 今後のためにGoogle Chromeをダウンロードしましょう ( https://www.google.co.jp/chrome/ )

- Google Chromeをデフォルトのブラウザとして使う ( https://www.atmarkit.co.jp/ait/articles/1508/05/news031.html )

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

### 準備

- 事前準備

  ```bash
  $ mkdir lecture_3-4
  $ cd lecture_3-4
  ```

- Node.jsをダウンロードする ( https://nodejs.org/ja/ )

  ```bash
  $ npm --version
  ```

### いきなりアプリを作ってみる

- npx を使って mec-app というNuxtアプリを作る命令

  ```bash
  $ npx create-nuxt-app mec-app

  <!-- 順番に質問に答えていく -->
  $ ? Project name
        mec-app
  $ ? Project description
        First web app for MEC lecture
  $ ? Use a custom server framework
        express
  $ ? Choose features to install (Press <space> to select, <a> to toggle all, <i> to invert selection)
        Progressive Web App (PWA) Support, Linter / Formatter, Prettier, Axios
  $ ? Use a custom UI framework
        none
  $ ? Use a custom test framework
        none
  $ ? Choose rendering mode
        Universal
  $ ? Author name
        Ei Hirai
  $ ? Choose a package manager
        npm
  ```

  - アプリを立ち上げてみる

  ```bash
  <!-- アプリのディレクトリに移動 -->
  $ cd mec-app

  <!-- 必要なパッケージをインストールする -->
  $ npm install

  <!-- 開発環境(=development) を立ち上げるコマンド -->
  $ npm run dev
  ```

## 第 4 回 20190724 Nuxt.jsでサンプルを更新してオリジナルアプリを作る

### 三菱地所へのリンクを貼ってみる

`/pages/index.vue`
```html
<!-- 略 -->
<div class="links">
  <a href="http://www.mec.co.jp/" target="_blank" class="button--green"
    >Mitsubishi Estate</a
  >
</div>
<!-- 略 -->
```
- divタグ: HTMLの基本であり、囲った部分をブロックレベル要素としてグループ化する
- aタグ:   Anchor（アンカー）の略で、リンクの出発点や到達点を指定するタグ
  * href:   領域をクリックした際のリンク先を指定
  * target: リンク先の文書を表示させる方法を指定
- 詳しくは以下 https://html-coding.co.jp/annex/dictionary/html/

### 新しいページを作ってみる

- /pages/index.vueがrootファイルでこの下にディレクトリを連ねていく
- /pages/user/index.vueファイルを作ってみる ( これは"/user"というURLに対応します )
  ```bash
  <!-- ディレクトリを作る -->
  $ mkdir user

  <!-- ファイルを作る -->
  $ New-Item index.vue
  ```
- ブラウザのURLバーに /user と打ち込んでみる ( まだ何もない空白のページ )
- ページを更新する

  `/pages/user/index.vue`
  ```html
  <template>
    <div class="container">
      <div>
        <logo />
        <h1 class="title">
          mec-app
        </h1>
        <h2 class="subtitle">
          First web app for MEC lecture
        </h2>
      </div>
    </div>
  </template>

  <script>
  import Logo from '~/components/Logo.vue'

  export default {
    components: {
      Logo
    }
  }
  </script>

  <style>
  .container {
    margin: 0 auto;
    min-height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
    text-align: center;
  }

  .title {
    font-family: 'Quicksand', 'Source Sans Pro', -apple-system, BlinkMacSystemFont,
      'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
    display: block;
    font-weight: 300;
    font-size: 100px;
    color: #35495e;
    letter-spacing: 1px;
  }

  .subtitle {
    font-weight: 300;
    font-size: 42px;
    color: #526488;
    word-spacing: 5px;
    padding-bottom: 15px;
  }

  .links {
    padding-top: 15px;
  }
  </style>
  ```

### ページへのリンクを作ってみる

`pages/index.vue`
```html
<!-- 略 -->
<div class="links">
  <nuxt-link to="/">ホーム画面に戻る</nuxt-link>
</div>
<!-- 略 -->
```

### ページに地図を表示する

- ***
