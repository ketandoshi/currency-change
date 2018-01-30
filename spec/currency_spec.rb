require 'currency'
require 'currency_coin'
require 'change_finder'

describe Currency do

  let(:coins) { CurrencyCoin.new({}) }
  let(:currency) { Currency.new(coins) }

  describe '.change_for' do
    it "should return change for valid amount" do
      expect(currency.change_for(25)).to eq({"quarters"=>1})
      expect(currency.change_for(41)).to eq({"quarters"=>1, "dimes"=>1, "nickels"=>1, "pennies"=>1})
    end

    it "should return no option for invalid amount" do
      expect(currency.change_for(0)).to eq("No Option")
      expect(currency.change_for(-1)).to eq("No Option")
    end
  end
end