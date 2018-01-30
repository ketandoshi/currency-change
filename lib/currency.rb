class Currency

  attr_accessor :currency_list, :coin_list

  def initialize(currency_coin_obj)
    @currency_list = currency_coin_obj.currency_list
    @coin_list = currency_coin_obj.coin_list
  end

  def change_for(amount)
    currency_change = ChangeFinder.new(
      @coin_list
    ).pick_required_change(
      amount.to_i
    )

    summarize(currency_change)
  end

  def summarize(currency_change)
    if !currency_change.empty?
      currency_change.inject({}){|h, (k,v)| h[@currency_list[k]] = v; h }
    else
      'No Option'
    end
  end

end