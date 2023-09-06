require 'spec_helper'
require_relative '../rentals'
require_relative '../book'
require_relative '../person'

RSpec.describe Rentals do
  let(:person) { Person.new(25, 'John Doe', parent_permission: true) }
  let(:book) { Book.new('Sample Title', 'Sample Author', 1) }
  let(:date) { '2023-09-01' }
  let(:rental) { Rentals.new(person, book, date) }

  describe '#initialize' do
    it 'creates a new rental with the correct attributes' do
      expect(rental.date).to eq(date)
      expect(rental.person).to eq(person)
      expect(rental.book).to eq(book)
    end

    it 'adds the rental to the book' do
      expect(book.rentals).to include(rental)
    end

    it 'adds the rental to the person' do
      expect(person.rentals).to include(rental)
    end
  end
end
