# 整数の入力
n, q = gets.chomp.split(" ").map(&:to_i)

balls = ('A'..'Z').to_a[0...n]

answers = []
i = 0
while q > 0 do
  # indexが最後を指していたら、最初に戻す
  if i == n - 1
    i = 0
  end
  # 質問入力
  puts "?#{balls[i % n]}#{balls[(i+1) % n]}"
  # 答え取得
  ans = gets.chomp
  # 答えを記録
  answers << ans

  # 終了判定
  if answers.last(n).filter { |ans| ans == "<" }.length == n
    puts "!#{balls.join('')}"
    break
  end

  # ソート
  if ans == ">"
    temp = balls[i % n]
    balls[i % n] = balls[(i+1) % n]
    balls[(i+1) % n] = temp
  end

  i += 1;
  q -= 1;
end
