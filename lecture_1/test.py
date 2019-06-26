# 第 1 回 20190703 Python環境構築とサンプルプログラム

import numpy as np

# 文字列を表示する
print("Hello, world")

# 簡単な計算をする
a = 10
b = 4
print(a - b)

# 0〜10の乱数を生成する
c = np.random.randint(10)
d = np.random.randint(10)
correct_answer = c - d

# プログラミングっぽいことをしてみる
def quiz():
  answer = input("数字を回答して下さい: " + str(c) + " - " + str(d) + " = ")
  if int(answer) == correct_answer:
    return True
  else:
    return False

if __name__ == '__main__':
  if quiz():
    print("正解です")
  else:
    print("不正解です")
