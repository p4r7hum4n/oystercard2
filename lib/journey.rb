class Journey

  PENALTY_FARE = 6

  def initialize
    @fare = PENALTY_FARE
  end

  def complete?
  end

  def fare
    @fare
  end

  def finish(station)
    self
  end

end