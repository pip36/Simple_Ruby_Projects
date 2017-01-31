def prompt_user
  puts "Enter your secret message: "
  input = gets
  puts  "Enter the number to shift: (values between -25 and 25)"

  shift_amount = gets.to_i
  shift_amount > -26 && shift_amount < 26 ? caesar_shift(input, shift_amount) : "fail"

end

def caesar_shift(message, shift)

letters = message.split("")
num_array = []
letters.each { |l| num_array << l.ord}

num_array.map! do |num|
x = 0
#lower case
  if num >= 97
    x = num + shift
    x > 122 ? x-= 26 : x = x
    x < 97 ? x += 26 : x = x
    num = x.chr
#uppercase
  elsif num >= 65 && num <= 90
    x = num + shift
    x > 90 ? x -= 26 : x = x
    x < 65 ? x += 26 : x = x
    num = x.chr
#other characters
  else
    x = num
    num = x.chr
  end
end
 puts num_array.join("")
end


prompt_user()
