# This is data analysis sample code for MEC lecutre
# date: 20190710
# lec_number: 3
# ref_url: "https://qiita.com/t2h5/items/6fc4e8c2f314684fa120"

require 'daru'
# CSVの中身を'data'という変数に代入する
data = Daru::DataFrame.from_csv('data.csv')

# 欠損値の処理
# map: 順番に全てのデータに対して処理を行う
data.map {|vector| [vector.name, vector.count_values(nil)] }
data.reject_values(nil)

# グルーピング
# 欠損値を削除して'gender', 'age', 'score'についてまとめる
data2 = data['gender', 'age', 'score'].reject_values(nil)
# 年齢を10歳刻みで整える
data2.add_vector('agg_age', (data2.age / 10) * 10)
# 性別、年齢ごとにスコアの中央値を計算する
output = data2.group_by(["gender"], ["agg_age"]).mean.score

puts("===== 女性／得点の中央値: =====")
puts("10代: " + output[0].to_s)
puts("20代: " + output[1].to_s)
puts("30代: " + output[2].to_s)
puts("40代: " + output[3].to_s)

puts("===== 男性／得点の中央値 =====")
puts("10代: " + output[4].to_s)
puts("20代: " + output[5].to_s)
puts("30代: " + output[6].to_s)
puts("40代: " + output[7].to_s)