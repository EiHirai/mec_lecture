## 第 3 回 20190717 三菱地所の物件データをWebsiteから取得する

Referrence:

- https://www.crummy.com/software/BeautifulSoup/bs4/doc/

- https://office.mec.co.jp/search/lineup/1/

### 事前準備

- VSCode の Powershell で `mec_lecture` にディレクトリに移動する

```bash
$ mkdir lecture_3
$ cd lecture_3
```

### Google Colaboratory

  <=== 公式 ===>

  https://colab.research.google.com/

- 先日インストールした Google Chrome を立ち上げる

- Google Chrome で自分の Google account にログインしているかチェック

### 情報取得

#### まずはウェブサイトの構造を見てみる

```python
from bs4 import BeautifulSoup
import requests
```

```python
# とりあえず新丸ビルのURLを指定する
url = 'https://office.mec.co.jp/search/detail/928/'
```

```python
# HTTPリクエスト(GET)を発行する
# 参考： https://qiita.com/r_fukuma/items/a9e8d18467fe3e04068e
r = requests.get(url)
```

```python
# BeautifulSoupでパースする
soup = BeautifulSoup(r.text, 'html.parser')
```

```python
# データを見てみる。これが新丸ビルのページ
soup
```

#### いよいよデータを取得する

```python
# 物件名称を取得するために<title>タグを取ってくる
soup.select('title')
```

```python
# どうやら配列の一番最初の項目が物件名称っぽいので取ってくる
soup.select('title')[0]
```

```python
# 中の文字列だけ取ってくる
soup.select('title')[0].string
```

```python
# | 以降が邪魔なので、' | 'で分割してみる
soup.select('title')[0].string.split(' | ')
```

```python
# 最初のやつが物件名称なので取ってきて name という変数に入れる
name = soup.select('title')[0].string.split(' | ')[0]
name
```

```python
# 次に、延床面積と有効面積はどうやら<dt><dd>タグに入ってるっぽいから取ってくる
dts = soup.select('dt')
dds = soup.select('dd')
```

```python
# dtsの中身を見てみる
dts
```

```python
# ddsも見てみる
dds
```

```python
# dtsとddsを対応させて、{'key': 'value'}という辞書を作ってresultsという変数に入れる
results = {
    k.text: v.text for k, v in zip(dts, dds)
}
results
```

```python

# results['key']で value を取得できるので、所在地、延床面積、有効面積を取得する
address = results['所在地']
gfa = results['延床面積']
nla = results['有効面積']
```

```python
adress
```

```python
gfa
```

```python
nla
```

```python
# GFAとNLAは㎡以降が邪魔なので、㎡でsplitとして最初の要素を取得する
gfa = results['延床面積'].split('㎡')[0]
nla = results['有効面積'].split('㎡')[0]

print(gfa)
print(nla)
```

```python
# 少数(float)にするために','を''(空文字)に変換する
gfa = results['延床面積'].split('㎡')[0].replace(',', '')
nla = results['有効面積'].split('㎡')[0].replace(',', '')

print(gfa)
print(nla)
```

```python
# 少数に変更する
gfa = float(results['延床面積'].split('㎡')[0].replace(',', ''))
nla = float(results['有効面積'].split('㎡')[0].replace(',', ''))

print(gfa)
print(nla)
```

#### 取得した情報をデータフレームにする

```python
import pandas as pd
```

```python
# 一つデータフレームを作ってみる
data = pd.DataFrame({
      '物件名称': [name],
      '所在地': [address],
      '延床面積': [gfa],
      '有効面積': [nla]
  })
data
```

#### 上記を応用していよいよ全物件を取得する

```python
# 最初にProperty_codeを書いておきます
property_codes = ['506', '507', '513', '514', '522', '524', '525', '526', '527', '530',
                                '531', '543', '544', '551', '867', '869',  '873', '874', '875', '905',
                                '915', '916', '917', '922', '927', '928', '952', '959', '984', '988',
                                'Z02', '5A2', '5C5', '5C6', '5D1', '5J1']
```

```python
# 空の配列を作ってこれにデータを入れていく
df = []

# for文で順番に処理する
for property_code in property_codes:
    # 今何の処理をしているか表示する
    print("property_code: %s" % property_code)

    url = 'https://office.mec.co.jp/search/detail/' + property_code
    r = requests.get(url)
    soup = BeautifulSoup(r.text, 'html.parser')

    name = soup.select('title')[0].string.split(' | ')[0]

    dts = soup.select('dt')
    dds = soup.select('dd')
    results = {
        k.text: v.text for k, v in zip(dts, dds)
    }

    address = results['所在地']
    gfa = float(results.get('延床面積', "0").split('㎡')[0].replace(",", ""))
    nla = float(results.get('有効面積', "0").split('㎡')[0].replace(",", ""))

    data = pd.DataFrame({
        '物件コード': [property_code],
        '物件名称': [name],
        '所在地': [address],
        '延床面積': [gfa],
        '有効面積': [nla]
    })

    # さっき作った空の配列にデータを入れていく
    df.append(data)

df = pd.concat(df)
```

```python
# DataFrameを確認する
df
```

#### データを整形する

```python
# 二重橋ビルの面積がゼロなの気になる。。。
df[df.物件名称 == "丸の内二重橋ビル"]
```

```python
# https://office.mec.co.jp/news_file/25/mec181121_nijjubashi.pdf
# 延床面積はどうやら 174054.18 ㎡っぽいので代入する
df.loc[df.物件名称 == "丸の内二重橋ビル", "延床面積"] = 174054.18
```

```python
# 同様に、常盤橋PJが地番っぽいので、とりあえず旧JXビルの住所を入れておく
df.loc[df.物件名称 == '東京駅前常盤橋プロジェクトＡ棟', '所在地'] = '東京都千代田区大手町2-6-3'
```

```python
df
```

#### 緯度経度をデータに付け足す

```python
# 緯度経度はGoogle Geocodingから取得できる
url_latlon = 'https://www.geocoding.jp/?q=東京都千代田区丸の内1-5-1'
```

```python
r_latlon = requests.get(url_lonlat)
```

```python
soup = BeautifulSoup(r_lonlat.text, 'html.parser')
soup
```

```python
lon = float(soup.select('.latlng')[0].select('b')[0].string)
lat = float(soup.select('.latlng')[0].select('b')[1].string)

print(lon)
print(lat)
```

```python
# for文で一気に取得
latlon = []

for address in df['所在地']:
    # 今何の処理をしているか表示する
    print("所在地: %s" % address)

    url = 'https://www.geocoding.jp/?q=' + address
    r = requests.get(url)
    soup = BeautifulSoup(r.text, 'html.parser')

    lat = float(soup.select('.latlng')[0].select('b')[0].string)
    lon = float(soup.select('.latlng')[0].select('b')[1].string)

    data = pd.DataFrame({
        '緯度': [lat],
        '経度': [lon]
    })

    # さっき作った空の配列にデータを入れていく
    latlon.append(data)

latlon = pd.concat(latlon)
```

```python
# 中身を確認
latlon
```

```python
# 先ほどの　df　に取得した緯度経度を付け足す
df = df.merge(latlon)
df
```

```python
# CSVに保存する
df.to_csv('mec_property.csv', sep=',')
```

```python
# ローカルにダウンロードしたい場合は以下の通り
from google.colab import files
files.download('mec_property.csv')
```
