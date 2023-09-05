require 'spec_helper'
require_relative '../book'

Rspec.describe Book do
  let(:book) { Book.new('Sample Title', 'Sample Author', 1) }

  describe '#initialize' do
    it 'creates a new book with the given title, author, and index' do
      expect(book.title).to eql('Sample Title')
      expect(book.author).to eql('Sample Author')
      expect(book.index).to eql(1)
      expect(book.rentals).to be_an(Array)
      expect(book.rentals).to be_empty
    end
  end

  describe '#add_rental' do
    it 'adds a rental to the book and to the associated person' do
      person = double('Person')
      expect(person).to receive(:add_rental).with(book, anything)

      rental = double('Rental')

      expect(rental).to receive(:book=).with(book)
      expect(rental).to receive(:person=).with(person)

      book.add_rental(person, rental)

      expect(book.rentals).to include(rental)
    end
  end
end
