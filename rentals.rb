# Class rentals

class Rentals
  attr_accessor :person, :book, :date

  def initialize(person, book, date)
    @person = person
    @book = book
    @date = date
    book.add_rental(person, self)
    person.add_rental(self)
  end
end
