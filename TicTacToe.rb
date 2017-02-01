class Cell
  def initialize(sign, id)
    @sign = sign
    @id = id
  end
  def sign
    @sign
  end
  def put_cross
    @sign = "X"
  end
  def put_naught
    @sign = "O"
  end
end

array = []
cell1 = Cell.new("1",1)
cell2 = Cell.new("2",2)
cell3 = Cell.new("3",3)
cell4 = Cell.new("4",4)
cell5 = Cell.new("5",5)
cell6 = Cell.new("6",6)
cell7 = Cell.new("7",7)
cell8 = Cell.new("8",8)
cell9 = Cell.new("9",9)

array.push(cell1,cell2,cell3,cell4,cell5,cell6,cell7,cell8,cell9)

def draw_grid(in_value = 0, player_number = 0, cell_array)
(0...9).each do |i|
  cellvalue = cell_array[i].sign

    if in_value == cellvalue
      if player_number == 1
        cell_array[i].put_cross
      end
      if player_number == 2
        cell_array[i].put_naught
      end
    end
end
puts"-----------"
puts"--#{cell_array[0].sign}--#{cell_array[1].sign}--#{cell_array[2].sign}--"
puts"--#{cell_array[3].sign}--#{cell_array[4].sign}--#{cell_array[5].sign}--"
puts"--#{cell_array[6].sign}--#{cell_array[7].sign}--#{cell_array[8].sign}--"
puts"-----------"
end

def win_check(array, player)
  top_row = [array[0].sign, array[1].sign, array[2].sign]
  middle_row = [array[3].sign, array[4].sign, array[5].sign]
  bottom_row = [array[6].sign, array[7].sign, array[8].sign]
  left_column = [array[0].sign, array[3].sign, array[6].sign]
  middle_column = [array[1].sign, array[4].sign, array[7].sign]
  right_column = [array[2].sign, array[5].sign, array[8].sign]
  diagonal_1 = [array[0].sign, array[4].sign, array[8].sign]
  diagonal_2 = [array[6].sign, array[4].sign, array[2].sign]

if top_row.uniq.length == 1 || middle_row.uniq.length == 1 || bottom_row.uniq.length == 1 \
  || left_column.uniq.length == 1 || middle_column.uniq.length == 1 || right_column.uniq.length == 1 \
  || diagonal_1.uniq.length == 1 || diagonal_2.uniq.length == 1
    puts "#{player} WINS!"
    exit
end
end

puts "------------------------------------------"
puts "------_______________________________-----"
puts "------_______________________________-----"
puts "------------------|    |------------------"
puts "------------------|    |------------------"
puts "------------------|    |------------------"
puts "------------------|    |------------------"
puts "------------------|    |------------------"
puts "------------------|    |------------------"
puts "------------------|    |------------------"
puts "------------------|____|------------------"
puts "------------------------------------------"
gets

4.times do
  draw_grid(array)
  puts "Player 1! put a X"
  input = gets.chomp
  draw_grid(input,1, array)
  win_check(array, "Player 1")
  puts "Player 2! put a O"
  input = gets.chomp
  draw_grid(input,2, array)
  win_check(array, "Player 2")
end

puts "Last go!"
input = gets.chomp
draw_grid(input,1, array)
win_check(array, "Player 1")
puts "DRAW!"
