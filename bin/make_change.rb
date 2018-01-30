require 'optparse'
require_relative '../lib/currency'
require_relative '../lib/currency_coin'
require_relative '../lib/change_finder'

# Get currency list if required
puts "Default coins are:: Quarter => 25, Dime => 10, Nickel => 5, Penny => 1\n
Do you want to provide different coins (Y/N)?"

response = gets.chomp

currency_list = Hash.new

if response.upcase == 'Y'
  puts "Provide space separated currencies e.g.: (Quarter 25 Dime 10 Nickel 5 Penny 1)::"
  currency_list = gets.chomp
end

# Setup the currency details
def setup_currency(currency_list)
  coins = CurrencyCoin.new(currency_list)

  currency = Currency.new(coins)

  currency
end

currency = setup_currency(currency_list)

# Get amount to get the change in provided currency
puts "Enter amount (non-negative) to get change::"

ARGF.each do |amount|
  begin
    puts currency.change_for(amount.chomp)
  rescue StandardError
    puts 'No option'
  end
end