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
  # deduct is now a private method
  # describe "#deduct" do 
  #   it "deducts the cost of the ticket" do
  #     oystercard.top_up(10)
  #     expect(oystercard.deduct(5)).to(eq(5))
  #   end
  # end
  describe "#touch_in" do
    let(:station) { double :station }

    it "changes value of in_journey to true" do
      oystercard.top_up(5)
      oystercard.touch_in(station)
      expect(oystercard.in_journey).to eq(true)
    end

    it "raises an error if balance is below 1" do
      expect { oystercard.touch_in(station) }.to raise_error("Balance below #{OysterCard::MINIMUM}!")
    end

    it "remembers the entry station" do
      oystercard.top_up(5)
      oystercard.touch_in(station)
      expect(oystercard.entry_station).to eq(station)
    end

  end
  describe "#touch_out" do
    let(:station) { double :station }

    it "changes value of in_journey to false" do
      oystercard.top_up(1)
      oystercard.touch_out
      expect(oystercard.in_journey).to eq(false)
    end

    it "deducts the minimum fare from balance" do
      oystercard.top_up(1)
      expect { oystercard.touch_out }.to change{ oystercard.balance }.by(-OysterCard::MINIMUM)
    end

    it 'changes entry_station to nil when touching out' do
      oystercard.top_up(5)
      oystercard.touch_in(station)
      oystercard.touch_out
      expect(oystercard.entry_station).to be nil
    end
  end

  describe "#in_journey?" do
    let(:station) { double :station }
    it "states whether it's in a journey" do
      oystercard.top_up(5)
      oystercard.touch_in(station)
      expect(oystercard.in_journey?).to eq(true)
    end
  end

end