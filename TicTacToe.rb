#Displays an array as a grid
class Grid
  def display_grid(cell_array)
    puts"-----------"
    puts"--#{cell_array[0].value}--#{cell_array[1].value}--#{cell_array[2].value}--"
    puts"--#{cell_array[3].value}--#{cell_array[4].value}--#{cell_array[5].value}--"
    puts"--#{cell_array[6].value}--#{cell_array[7].value}--#{cell_array[8].value}--"
    puts"-----------"
  end
end
#creates an array of cells, and tracks their value
class CellManager
  def initialize
    @array = []
    cell1 = Cell.new("1","1")
    cell2 = Cell.new("2","2")
    cell3 = Cell.new("3","3")
    cell4 = Cell.new("4","4")
    cell5 = Cell.new("5","5")
    cell6 = Cell.new("6","6")
    cell7 = Cell.new("7","7")
    cell8 = Cell.new("8","8")
    cell9 = Cell.new("9","9")
    @array.push(cell1,cell2,cell3,cell4,cell5,cell6,cell7,cell8,cell9)


  end
  def array
    @array
  end

  def find_cell(id)
     array.each do |c|
       if c.id == id
         return c
       end
     end
  end

  def win_check(player)

    @top_row = [@array[0].value, @array[1].value, @array[2].value]
    @middle_row = [@array[3].value, @array[4].value, @array[5].value]
    @bottom_row = [@array[6].value, @array[7].value, @array[8].value]
    @left_column = [@array[0].value, @array[3].value, @array[6].value]
    @middle_column = [@array[1].value, @array[4].value, @array[7].value]
    @right_column = [@array[2].value, @array[5].value, @array[8].value]
    @diagonal_1 = [@array[0].value, @array[4].value, @array[8].value]
    @diagonal_2 = [@array[6].value, @array[4].value, @array[2].value]

    if @top_row.uniq.length == 1 || @middle_row.uniq.length == 1 || @bottom_row.uniq.length == 1 \
      || @left_column.uniq.length == 1 || @middle_column.uniq.length == 1 || @right_column.uniq.length == 1 \
      || @diagonal_1.uniq.length == 1 || @diagonal_2.uniq.length == 1
        puts "#{player} WINS!"
        exit
    end
  end
end

class Cell
  def initialize(val, id)
    @value = val
    @id = id
  end
  def set_value(value)
    @value = value
  end
  def value
    @value
  end
  def id
    @id
  end
end

class Player
  def initialize(symbol)
    @name = "Player"
    @symbol = symbol
    @is_active = false
  end

  def name
    @name
  end
  def symbol
    @symbol
  end
  def set_name(name)
    @name = name
  end
end


cell_manager = CellManager.new
grid = Grid.new()
player1 = Player.new("X")
player2 = Player.new("O")
puts "Welcome to tic-tac-toe! Player 1, please enter your name: "
player1.set_name(gets.chomp)
puts "Hello #{player1.name}! Player 2, please enter your name: "
player2.set_name(gets.chomp)
puts "Hello #{player2.name}! You'll be naughts, and #{player1.name} you'll be crosses"

4.times do
  grid.display_grid(cell_manager.array)

  puts "Player 1! put a X"
  input = gets.chomp
  cell_manager.find_cell(input).set_value(player1.symbol)
  grid.display_grid(cell_manager.array)
  cell_manager.win_check(player1.name)

  puts "Player 2! put a O"
  input = gets.chomp
  cell_manager.find_cell(input).set_value(player2.symbol)
  grid.display_grid(cell_manager.array)
  cell_manager.win_check(player2.name)
end

puts "Last go!"
input = gets.chomp
cell_manager.find_cell(input).set_value(player1.symbol)
grid.display_grid(cell_manager.array)
cell_manager.win_check(player1.name)
puts "DRAW!"

#-----------------------------------------------------------------------#
#-----------------------------------------------------------------------#
=begin
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
=end
