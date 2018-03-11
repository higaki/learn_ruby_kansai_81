# Enumerable#map を自作してみよう

module Enumerable
  def my_map
    # ブロックがもらえなければ Enumerator を返す
    return to_enum __callee__ unless block_given?

    inject([]) do |result, item|
      # ブロックの評価結果を追加する
      result << yield(item)
    end
  end
end

a = [*0..3]         # => [0, 1, 2, 3]

a.map{|i| i * i}    # => [0, 1, 4, 9]
a.map(&:to_s)       # => ["0", "1", "2", "3"]

i = a.map           # => #<Enumerator: [0, 1, 2, 3]:map>
i.next              # => 0
i.next              # => 1
i.next              # => 2
i.next              # => 3
begin
  i.next            # => 
rescue
  $!                # => #<StopIteration: iteration reached an end>
end


a.my_map{|i| i * i}     # => [0, 1, 4, 9] # !> shadowing outer local variable - i
a.my_map(&:to_s)        # => ["0", "1", "2", "3"]
j = a.my_map            # => #<Enumerator: [0, 1, 2, 3]:my_map>
j.next                  # => 0
j.next                  # => 1
j.next                  # => 2
j.next                  # => 3
begin
  j.next                # => 
rescue
  $!                    # => #<StopIteration: iteration reached an end>
end
