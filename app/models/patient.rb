class Patient
  attr_reader :name
  attr_accessor :room, :id

  def initialize(attributes = {})
    @id = attributes[:id] # integer
    @name = attributes[:name]   # string
    @cured = attributes[:cured] || false # boolean
    @room = attributes[:room] # instance
  end

  def cured?
    @cured
  end

  def cured!
    @cured = true
  end
end

# p scott = Patient.new('scott', false, '123 address', 'A-')
# p scott = Patient.new(name: 'scott', cured: true)
# p nick = Patient.new(name: 'nick')
