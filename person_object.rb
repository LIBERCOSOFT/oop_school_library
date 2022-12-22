require_relative './decorator'
require_relative './rental_object'

class Person < Nameable
  attr_accessor :name, :age, :rentals
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permission: true, rentals: [])
    @id = Random.rand(1..1234)
    @age = age
    @name = name
    @parent_permission = parent_permission
    @rentals = rentals
    super()
  end

  def correct_name
    @name
  end

  def add_rental(date, book)
    Rental.new(date, self, book)
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
