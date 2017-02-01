module Enumerable

  def my_each
      for i in self
          yield(i)
      end
  end
  def my_each_with_index
      for i in self
        yield(i,)
      end
  end

end


test_array = [1,2,3,4]
test_array.my_each {|i| puts i}
test_array.each_with_index {|item, index| puts item + index}
