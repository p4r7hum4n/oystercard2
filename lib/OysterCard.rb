class OysterCard

  LIMIT = 90

  attr_reader :balance

  def initialize
    @balance = 0
  end

  def balance
    @balance
  end

  def top_up(amount)
    fail "Balance cannot exceed #{LIMIT}!" if limit?(amount)
    @balance += amount
  end

  private

  def limit?(amount)
    @balance + amount > LIMIT
  end
end
