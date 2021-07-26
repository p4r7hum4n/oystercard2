class OysterCard

  LIMIT = 90
  MINIMUM = 1
  attr_reader :balance, :in_journey

  def initialize(balance = 0)
    @balance = balance
    @in_journey = nil
  end

  def balance
    @balance
  end

  def top_up(amount)
    fail "Balance cannot exceed #{LIMIT}!" if limit?(amount)
    @balance += amount
  end

  def touch_in
    fail "Balance below #{MINIMUM}!" if minimumBalance?
    @in_journey = true
  end

  def touch_out
    deduct(MINIMUM)
    @in_journey = false
  end

  def in_journey?
    @in_journey
  end

  private
  def minimumBalance?
    @balance < MINIMUM
  end

  def limit?(amount)
    @balance + amount > LIMIT
  end

  def deduct(amount)
    @balance -= amount
  end

end
