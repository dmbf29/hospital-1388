class Room
  def initialize(attributes = {})
    @capacity = attributes[:capacity] # integer
    @patients = [] # array of INSTANCES
  end

  def full?
    @patients.count >= @capacity
  end

  # vip.add_patient(scott)
  def add_patient(patient)
    if full?
      fail StandardError, 'Room is full'
    else
      patient.room = self
      @patients << patient
    end
  end
end
