def bubble_sort(numbers)
n = numbers.count - 1

  n.times do
    (0...n).each do |i|
        if numbers[i] > numbers[i+1]
            numbers[i], numbers[i+1] = numbers[i+1], numbers[i]
        end
     end
  end
puts numbers
end

bubble_sort([4,1,7,5,2,6,4,8,6,7,0])
