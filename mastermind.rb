

# guess "1908"
def compare(code,guess,is_player)
bulls = 0
cows = 0
code_numerals = code.split("")
guess_numerals = guess.split("")
future_guess = []


(0..3).each do |i|
  if guess_numerals[i] == code_numerals[i]
    bulls += 1
    cows -= 1
    if is_player == false
      future_guess << guess_numerals[i]
    end
  else
    random = Random.new
    g = random.rand(0..9).to_s
    future_guess << g
  end
end

guess_numerals.each do |num|
  if code_numerals.include? num
    cows += 1
  end
end

  if (bulls == 4) && is_player
    puts "You broke the code! Well Played!"
    exit
  else
    if is_player
    puts "#{bulls} numbers EXACTLY right"
    puts "#{cows} numbers are in the wrong place"
    end
  end
  if is_player == false
return future_guess.join("")
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
    compare(code, input, true)
    number_of_guesses -= 1
  end
  puts "You Lose!"
end

def run_computer_guess_game
  puts "My turn! Enter your code. I won't look... I promise. (only 4 digits please)"
  player_code = gets.chomp
  random = Random.new
  guess = random.rand(1000..9999).to_s

  12.times do
  puts "Is it #{guess}"
    if guess == compare(player_code, guess, false)
      puts "Got it! the code is #{guess}"
    else
      guess = compare(player_code, guess, false)
    end
  end
  puts "I give up!"
end

puts



3.times do
run_player_guess_game(12)
run_computer_guess_game
end
