require_relative 'person_object'

class Student < Person
  def initialize
    super()
    @classroom = 'classroom 1'
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
