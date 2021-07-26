class OysterCard

  attr_reader :balance

  def initialize
    @balance = 0
  end

  def balance
    @balance
  end

  def top_up(amount)
    fail "Balance cannot exceed 90!" if limit?(amount)
    @balance += amount
  end

  private

  def limit?(amount)
    @balance + amount > 90
  end
end
