class ChangeFinder

  attr_accessor :coin_list

  def initialize(coin_list)
    @coin_list = coin_list
  end

  def pick_required_change(amount)
    @change = Hash.new(0)
    find_change(amount, @coin_list)
    @change
  end

  private

  # This solution is inspired by: http://rubyquiz.com/quiz154.html
  #
  def find_change(amount, coin_list)
    coin_list.sort! { |x,y| y <=> x }

    picked_change = Hash.new do |hash, amount|
      if amount < coin_list.min
        []
      elsif coin_list.include?(amount)
        [amount]
      else
        coin_list.
          reject { |coin| coin > amount }.
          inject([]) {|selected_coins, coin| selected_coins.any? {|x| x%coin == 0} ? selected_coins : selected_coins+[coin]}.
          map { |coin| [coin] + hash[amount - coin] }.
          reject { |selected_coins| selected_coins.inject(0) {|sum,x| sum + x } != amount }.
          min { |a, b| a.size <=> b.size } || []
      end
    end

    picked_change[amount].each {|x| @change[x] += 1}
  end

end