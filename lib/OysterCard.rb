class OysterCard

  LIMIT = 90

  attr_reader :balance, :in_journey

  def initialize
    @balance = 0
    @in_journey = nil
  end

  def balance
    @balance
  end

  def top_up(amount)
    fail "Balance cannot exceed #{LIMIT}!" if limit?(amount)
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def touch_in
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end

  def in_journey?
    @in_journey
  end

  private

  def limit?(amount)
    @balance + amount > LIMIT
  end
end
