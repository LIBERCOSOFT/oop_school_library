require_relative 'person_object'

class Teacher < Person
  def initialize
    super()
    @specialization = 'Science'
  end

  def can_use_service?
    true
  end
end
