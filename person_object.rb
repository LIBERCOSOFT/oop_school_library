class Nameable
  def correct_name
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end

class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permission: true)
    @age = age
    @name = name
    @parent_permission = parent_permission
  end

  def correct_name
    @name
  end

  def can_use_service?
    return true if of_age? || @parent_permission
  end

  private

  def of_age?
    return true if @age >= 18

    false
  end
end
