# frozen_string_literal: true

# Class Book

class Book
  attr_accessor :title, :author
  attr_reader :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(person, rental)
    @rentals << rental
    person.add_rental(rental)
  end
end
