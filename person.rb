class Person
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permission: true)
    @age = age
    @name = name
    @parent_permission = parent_permission
  end

  def can_use_service?
    return true if is_of_age? || @parent_permission
  end

  private

  def is_of_age?
    return true if @age >= 18

    false
  end
end

new_person = Person.new(17)
puts new_person.can_use_service?