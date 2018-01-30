require 'change_finder'

describe ChangeFinder do

  let(:coin_list) { [25, 10, 5, 1] }

  describe '.pick_required_change' do
    it "should return the change from provided coin list" do
      currency_change = ChangeFinder.new(coin_list).pick_required_change(25)

      expect(currency_change).to_not be_nil
      expect(currency_change).to be_a_kind_of(Hash)
      expect(currency_change).to have_key(25)
      expect(currency_change).to eq({25=>1})
    end
  end
end