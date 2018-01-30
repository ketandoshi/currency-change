require 'currency_coin'

describe CurrencyCoin do
  describe '.default_currency_list' do
    it "should return default currency list" do
      coin_obj = CurrencyCoin.new({})

      expect(coin_obj).to be_a_kind_of(CurrencyCoin)
      expect(coin_obj.currency_list).to eq({25=>"quarters", 10=>"dimes", 5=>"nickels", 1=>"pennies"})
      expect(coin_obj.coin_list).to eq([25, 10, 5, 1])
    end
  end

  describe '.requested_currency_list' do
    it "should return provided currency list" do
      coin_obj = CurrencyCoin.new('one 1 two 2')

      expect(coin_obj).to be_a_kind_of(CurrencyCoin)
      expect(coin_obj.currency_list).to eq({1=>"ones", 2=>"twos"})
      expect(coin_obj.coin_list).to eq([1, 2])
    end

    it "should raise exception" do
      expect { CurrencyCoin.new('one 1 two') }.to raise_exception(CurrencyCoin::InvalidInput)
    end
  end
end