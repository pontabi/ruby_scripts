def quick_sort(array)

  return array if array.size < 2
  # ピボットを設定
  pivot = array.shift

  # それぞれピボットより大きい要素、小さい要素を格納する配列。
  smallers = []
  biggers = []
  array.each do |ball|
    if a_is_bigger?(ball, pivot)
        biggers << ball
    else # num >= pivot
        smallers << ball
    end
  end
  quick_sort(smallers) + [pivot] + quick_sort(biggers)
end

def a_is_bigger?(a, b)
  puts "?#{a}#{b}"
  gets.chomp == ">"
end

n, q = gets.chomp.split(" ").map(&:to_i)
balls = ('A'..'Z').to_a[0...n]
puts "!" + quick_sort(balls).join("")
