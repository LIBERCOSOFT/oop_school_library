require_relative 'person_object'
require_relative 'classroom_object'

class Student < Person
  attr_accessor :classroom

  def initialize(age, classroom = 'Classroom 1')
    super(age)
    @classroom = classroom
  end

  def classrooms=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
