## 第 2 回 20190710 Pythonを使ってデータ分析をしてみる

Referrence:

- https://blog.prototypr.io/interactive-maps-with-python-part-1-aa1563dbe5a9

- https://github.com/vincentropy/python_cartography_tutorial

### 事前準備

- VSCode の Powershell で `mec_lecture` にディレクトリに移動する

```bash
$ mkdir lecture_2
$ cd lecture_2
```

### Google Colaboratory

  <=== 公式 ===>

  https://colab.research.google.com/

- 先日インストールした Google Chrome を立ち上げる

- Google Chrome で自分の Google account にログインしているかチェック

#### 使うデータを読み込む

- Githubから `start_subset.csv` と `stop_subset.csv` をダウンロード

- 以下のコードで Google Colaboratory に CSV をアップロード（時間かかります）

* `locations.csv`
* `start_subset.csv`
* `stop_subset.csv`

```python
from google.colab import files
```

```python
uploaded = files.upload()
for fn in uploaded.keys():
  print('User uploaded file "{name}" with length {length} bytes'.format(
      name=fn, length=len(uploaded[fn])))
```

### 本日使うデータセットを見てみる

- see jupyter notebook on Ei's Macbook

### Citi bike のデータを地図にプロットする

#### 地図(folium)を使ってみる

```python
import pandas as pd
import folium
```

```python
folium_map_test = folium.Map(location=[40.738, -73.98],
                        zoom_start=13,
                        tiles="CartoDB dark_matter")
marker = folium.CircleMarker(location=[40.738, -73.98])
marker.add_to(folium_map_test)
```

```python
folium_map_test
```

#### 10AM台のCiti bike移動を分析する

```python
# locations.csvを取り込む
locations = pd.read_csv('locations.csv')
locations.head()
```

```python
# データフレームを作る
departure_counts = pd.read_csv('departure_counts.csv')
arrival_counts = pd.read_csv('arrival_counts.csv')
```

```python
# 出発数
departure_counts.head()
```

```python
# 到着数
arrival_counts.head()
```

```python
# 出発と到着をData Frameとしてまとめる
trip_counts = departure_counts.merge(locations).merge(arrival_counts)
```

#### Plotting Markers for Each Station

```python
# こまめにデータを見てみる( again )
trip_counts.head()
```

```python
folium_map = folium.Map(location=[40.738, -73.98],
                        zoom_start=13,
                        tiles="CartoDB dark_matter")

trip_counts["net departures"] = trip_counts["departure count"] - trip_counts["arrival count"]

for index, row in trip_counts.iterrows():
    try:
        net_departures = row["net departures"]
        net_departures = net_departures / 2 # 円の大きさを調整
        radius = abs(net_departures) # 純出発or到着数が多いほど円が大きくなるように半径を設定しておく

        popup_text = """{}<br>
                        total departures: {}<br>
                        total arrivals: {}<br>
                        net departures: {}"""
        popup_text = popup_text.format(row["start station name"],
                                       row["arrival count"],
                                       row["departure count"],
                                       net_departures)

        if net_departures > 0:
            color="#E37222" # オレンジ
        else:
            color="#0A8A9F" # ティール

        folium.CircleMarker(location=(row["start station latitude"], row["start station longitude"]),
                                                            radius=radius,
                                                            color=color,
                                                            fill=True,
                                                            popup=popup_text
                                           ).add_to(folium_map) # 最初に定義しているfolium_mapというオブジェクトにデータを加える
    except ValueError:
        print(index)
```

```python
folium_map
```

```python
folium_map.save("./mapping_bike_data.html")
```

```python
files.download('mapping_bike_data.html')
```
