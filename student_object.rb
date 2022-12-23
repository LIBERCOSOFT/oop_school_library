require_relative 'person_object'

class Student < Person
  attr_reader :classroom

  def initialize(age, name, parent_permission, classroom = 'Classroom 1')
    super(age, name, parent_permission)
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
