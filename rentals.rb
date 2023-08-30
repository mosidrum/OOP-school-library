# Class rentals

class Rentals
  attr_accessor :date, :book, :person

  def initialize(person, book, date)
    @date = date
    @person = person
    @book = book
    book.rentals << self
    person.rentals << self
  end
end
