a = (0..9).to_a         # => [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

# 全要素の合計値を計算しよう
a.sum                   # => 45

a.inject{|s, i| s + i}  # => 45

a.inject do |s, i|
  s                     # => 0, 1, 3, 6, 10, 15, 21, 28, 36
  i                     # => 1, 2, 3, 4, 5, 6, 7, 8, 9
  s + i                 # => 1, 3, 6, 10, 15, 21, 28, 36, 45
end

# それでもブロックを引数で ...
a.inject(:+)            # => 45
