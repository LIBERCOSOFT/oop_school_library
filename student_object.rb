require_relative 'person_object'

class Student < Person
  def initialize(age, classroom = 'Classroom 1')
    super(age)
    @classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
