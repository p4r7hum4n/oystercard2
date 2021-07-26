require "OysterCard"

describe OysterCard do
  describe "#balance" do
    let(:oystercard) { OysterCard.new }
    it "should return balance" do
      expect(oystercard.balance).to eq(0)
    end
  end
end