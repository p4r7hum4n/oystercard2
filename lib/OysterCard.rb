class OysterCard

  LIMIT = 90
  MINIMUM = 1
  attr_reader :balance, :entry_station, :journeys

  def initialize(balance = 0)
    @balance = balance
    @entry_station = nil
    @exit_staton = nil
    @journeys = []
  end

  def balance
    @balance
  end

  def top_up(amount)
    fail "Balance cannot exceed #{LIMIT}!" if limit?(amount)
    @balance += amount
  end

  def touch_in(station)
    fail "Balance below #{MINIMUM}!" if minimumBalance?
    @entry_station = station
    @exit_station = nil
  end

  def touch_out(station)
    deduct(MINIMUM)
    @exit_station = station
    @journeys << {:entry_station => @entry_station, :exit_staton => @exit_station}
    @entry_station = nil
    
  end

  def in_journey?
    @entry_station != nil
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
