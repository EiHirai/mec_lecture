## 第 4 回 20190724 三菱地所の物件データを地図で分析してみる

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

### 三菱地所の物件を地図で分析

#### 第2回と第3回の振り返り

- 地図ライブラリ folium と、データフレームを扱う pandas を使う

- 第3回で作成した `mec_property.csv` をデータフレームとして、地図に描写する

#### 使うデータを読み込む

- 以下のコードで Google Colaboratory に CSV をアップロード（時間かかります）

* `mec_property.csv`

```python
from google.colab import files
```

```python
uploaded = files.upload()
for fn in uploaded.keys():
  print('User uploaded file "{name}" with length {length} bytes'.format(
      name=fn, length=len(uploaded[fn])))
```

```python
import pandas as pd
```

```python
df = pd.read_csv('mec_property.csv')
df
```

#### foliumを使う

```python
import folium
```

```python
folium_map = folium.Map(location=[35.682543, 139.764287], # 新丸ビルを中心とする
                        zoom_start=15,
                        tiles="cartodbpositron")
```

```python
# 見てみる
folium_map
```

```python
# 第2回でやったように地図に描画
folium_mec = folium.Map(location=[35.682543, 139.764287], # 新丸ビルを中心とする
                        zoom_start=15,
                        tiles="cartodbpositron")

for index, row in df.iterrows():
    try:
        gross_floor_area = row['延床面積']
        gross_floor_area =  gross_floor_area / 5000
        radius = gross_floor_area # 延床面積が大きいほど円が大きくなるように半径を設定しておく

        popup_text ="""
                    物件名称: {}<br>
                    所在地: {}<br>
                    延床面積: {}
                    """
        popup_text = popup_text.format(
                                        row['物件名称'],
                                        row['所在地'],
                                        gross_floor_area
                                      )

        color="#0A8A9F" # ティール

        folium.CircleMarker(location=(row['緯度'], row['経度']),
                                      radius=radius,
                                      color=color,
                                      fill=True,
                                      popup=popup_text
                                    ).add_to(folium_mec) # 最初に定義しているfolium_macというオブジェクトにデータを加える
    except ValueError:
        print(index)
```

```python
folium_mec
```

```python
# HTMLファイルを保存
folium_mec.save("./mec_gfa_distribution.html")
```

```python
files.download('mec_gfa_distribution.html')
```
