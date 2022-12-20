require_relative './rental_object'

class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author, rentals: [])
    @title = title
    @author = author
    @rentals = rentals
  end

  def add_rental(date, person)
    Rental.new(date, person, self)
  end
end
