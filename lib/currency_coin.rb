class CurrencyCoin
  require 'active_support/inflector'

  InvalidInput = Class.new(StandardError)

  attr_accessor :currency_list, :coin_list

  def initialize(currency_list = {})
    @currency_list = (
      currency_list.empty? ?
        default_currency_list :
        requested_currency_list(currency_list)
    )
    @coin_list = @currency_list.keys
  end

  def default_currency_list
    {
      'quarter'.pluralize => 25,
      'dime'.pluralize => 10,
      'nickel'.pluralize => 5,
      'penny'.pluralize => 1
    }.invert
  end

  def requested_currency_list(_currency_list)
    list_arr = _currency_list.split(' ')
    raise(InvalidInput, _currency_list) unless list_arr.size.even?

    currency_list = Hash[*list_arr]

    currency_list = currency_list.inject({}){|h, (k,v)|
      h[k.downcase.pluralize] = v.to_i; h
    }

    currency_list.invert
  end

end