class Book
  attr_reader :rentals
  attr_accessor :title, :book

  def initialize(title, book)
    @title = title
    @book = book
    @rentals = []
  end
end
