require 'spec_helper'

require_relative '../rentals'
require_relative '../book'
require_relative '../person'

RSpec.describe Rentals do
  let(:person) { Person.new(30, 'John Doe', parent_permission: true) }
  let(:book) { Book.new('Sample Title', 'Sample Author', 1) }
  let(:date) { '2023-09-01' }

  describe '#initialize' do
    it 'creates a new rental with the given person, book, and date' do
      rental = Rentals.new(person, book, date)

      expect(rental.person).to eq(person)
      expect(rental.book).to eq(book)
      expect(rental.date).to eq(date)

      expect(person.rentals).to include(rental)
      expect(book.rentals).to include(rental)
    end
  end
end
