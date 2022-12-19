require_relative 'Person'

class Student < Person
  def initialize
    super()
    @classroom = 'classroom 1'
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
