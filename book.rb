# Class Book

class Book
  attr_accessor :title, :author, :index
  attr_reader :rentals

  def initialize(title, author, index)
    @title = title
    @author = author
    @index = index
    @rentals = []
  end

  def add_rental(person, rental)
    @rentals << rental
    person.add_rental(rental)
  end
end
