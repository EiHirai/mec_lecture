# 第 1 回 20190703 Python環境構築とサンプルプログラム

# 文字列を表示する
print("Hello, world")

# 簡単な計算をする
a = 10
b = 4
correct_answer = a - b
print(correct_answer)

# プログラミングっぽいことをしてみる
def quiz():
  answer = input("数字を回答して下さい: " + str(a) + "-" + str(b) + "=")
  if int(answer) == correct_answer:
    return True
  else:
    return False

if __name__ == '__main__':
  if quiz():
    print("正解です")
  else:
    print("不正解です")
