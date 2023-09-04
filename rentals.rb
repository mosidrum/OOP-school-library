# frozen_string_literal: true

# Class rentals

class Rentals
  attr_accessor :date, :book, :person

  def initialize(person, book, date)
    @date = date
    @person = person
    @book = book
    book.add_rental(person, self)
    person.add_rental(self)
  end
end
