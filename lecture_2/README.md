# Tutorial: Interactive Maps with Python and Folium

## Part 1

Referrence:

- https://blog.prototypr.io/interactive-maps-with-python-part-1-aa1563dbe5a9

- https://github.com/vincentropy/python_cartography_tutorial

### Basic Maps and Circle Markers

#### Installing folium

`$ pip install folium`
`$ pip install pandas`

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

#### Showing Some Real Data, NYC Bike Trips

Referrence:

https://www.citibikenyc.com/system-data

```python
bike_data = pd.read_csv("201905-citibike-tripdata.csv")

# 一度確認してみましょう。head()はData Frameの最初の5レコードを取ってくるメソッドです
bike_data.head()
```

```python
bike_data["starttime"] = pd.to_datetime(bike_data["starttime"]) # "starttime"というカラム名のデータをdatetime型に変更
bike_data["stoptime"] = pd.to_datetime(bike_data["stoptime"]) # 同上
```

```python
# ”starttime"というカラム名のデータを時間単位で変換してその数値を"hour"というカラム名のデータとして保存
bike_data["start hour"] = bike_data["starttime"].apply(lambda x: x.hour)
```

```python
# もう一度確認してみましょう。head()はData Frameの最初の5レコードを取ってくるメソッドです
bike_data.head()
```

#### Net Arrivals/Departures

ここからは一つのバイクステーションから別の場所に大きな移動があるか、それはどんな時間帯に起きているかを見ていきます。

```python
# 出発地のステーションIDでまとめて、その中のレコードから最初の一つをそれぞれ取ってくる
locations = bike_data.groupby("start station id").first()

# 分析したい3つのカラムを取得する
locations = locations.loc[:, ["start station latitude", "start station longitude", "start station name"]]
```

```python
# こまめにデータを見てみる
locations.head()
```

```python
# 分析したい時間を定義する
selected_hour = 10
```

```python
# selected_hourに出発したデータを取ってきてサブセットとしてまとめる
start_subset = bike_data[bike_data["start hour"] == selected_hour]
departure_counts = start_subset.groupby("start station id").count() # count()はレコード数を返すメソッド
```

```python
# 全てのカラムに対してそのステーションIDが対応している数が出てきてしまったので( groupby（）の仕様です )、
# とりあえず最初のカラムを取ってくる
departure_counts = departure_counts.iloc[:, [0]]
# カラムを分かりやすい名称に変更する
departure_counts.columns = ["departure count"]
```

```python
# 到着についても同様にやってみる
bike_data["stop hour"] = bike_data["stoptime"].apply(lambda x: x.hour)
stop_subset = bike_data[bike_data["stop hour"] == selected_hour]
arrival_counts = stop_subset.groupby("start station id").count()
arrival_counts = arrival_counts.iloc[:, [0]]
arrival_counts.columns = ["arrival count"]
```

```python
# 出発と到着をData Frameとしてまとめる
trip_counts = departure_counts.join(locations).join(arrival_counts)
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
max_net_departures = max(abs(trip_counts["net departures"])) if len(trip_counts["net departures"]) > 0 else 0
max_net_departures = max_net_departures if max_net_departures != 0 else 1# 0のやつは無理矢理1にする

for index, row in trip_counts.iterrows():
    net_departures = row["net departures"]
    net_departures = net_departures / 2
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
```

```python
folium_map
```

```python
folium_map.save("./mapping_sample_"+str(selected_hour)+".html")
```
