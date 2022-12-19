require_relative 'person_object'

class Teacher < Person
  def initialize(age, specialization = 'Science')
    super(age)
    @specialization = specialization
  end

  def can_use_service?
    true
  end
end
