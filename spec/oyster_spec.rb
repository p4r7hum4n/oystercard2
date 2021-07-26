require "OysterCard"

describe OysterCard do
  let(:oystercard) { OysterCard.new }
  describe "#balance" do
    it "should return balance" do
      expect(oystercard.balance).to eq(0)
    end
  end
  describe "#top_up" do
    it "adds money to balance" do
      oystercard.top_up(10)
      expect(oystercard.balance).to(eq(10))
    end
    it "fails when user tops up more than 90" do
      expect { oystercard.top_up(91) }.to raise_error("Balance cannot exceed #{OysterCard::LIMIT}!")
    end
  end
  describe "#deduct" do 
    it "deducts the cost of the ticket" do
      oystercard.top_up(10)
      expect(oystercard.deduct(5)).to(eq(5))
    end
  end
end