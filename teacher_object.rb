require_relative 'person_object'

class Teacher < Person
  def initialize(age, name, specialization = 'Science')
    super(age, name)
    @specialization = specialization
  end

  def can_use_service?
    true
  end
end
