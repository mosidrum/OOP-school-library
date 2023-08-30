# Class Book

class Book
  attr_accessor :title, :author
  attr_reader :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(person, date)
    rent = Rental.new(date, self, person)
    @rentals << rent
  end
end
