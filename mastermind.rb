

# guess "1908"
def compare(code,guess)
bulls = 0
cows = 0
code_numerals = code.split("")
guess_numerals = guess.split("")

(0..3).each do |i|
  if guess_numerals[i] == code_numerals[i]
    bulls += 1
    cows -= 1
  end
end

guess_numerals.each do |num|
  if code_numerals.include? num
    cows += 1
  end
end

  if (bulls == 4)
    puts "You broke the code! Well Played!"
    exit
  else
    puts "#{bulls} numbers EXACTLY right"
    puts "#{cows} numbers are in the wrong place"
  end
end

def run_player_guess_game(guesses)
  random = Random.new
  code = random.rand(1000..9999).to_s

  number_of_guesses = guesses
  guesses.times do
    puts "#{number_of_guesses} tries left!"
    puts "Enter your guess (4digit number): "
    input = gets.chomp
    compare(code, input)
    number_of_guesses -= 1
  end
  puts "You Lose!"
end


run_player_guess_game(12)

puts "My turn! Enter your code. I won't look... I promise. (only 4 digits please)"
player_code = gets.chomp


random = Random.new
guess = random.rand(1000..9999).to_s
puts guess
compare(player_code, guess)
