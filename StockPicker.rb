def stock_picker(stock_prices)
best_profit = 0
buy = 0
sell = 0

(0...stock_prices.count).each do |x|
  (x+1...stock_prices.count).each do |i|

    if check_profit(stock_prices[x],stock_prices[i]) > best_profit
      best_profit = check_profit(stock_prices[x],stock_prices[i])
      buy = x + 1
      sell = i + 1
    end
  end
end
puts "Buy on day #{buy}, and sell on day #{sell}, for a profit of £#{best_profit}!"
end

def check_profit(buy_day, sell_day)
  profit = sell_day - buy_day
end

def user_prompt
puts "Enter stock prices separated by commas: (e.g. 12,3,5,63) "
array = gets.split(",")
array.map! {|val| val.to_i}
stock_picker(array)
end

user_prompt()
