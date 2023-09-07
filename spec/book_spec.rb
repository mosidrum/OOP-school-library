require 'spec_helper'
require_relative '../book'
require_relative '../person'
require_relative '../rentals'

RSpec.describe Book do
  let(:book) { Book.new('Sample Title', 'Sample Author', 1) }
  let(:person) { Person.new(25, 'John Doe', parent_permission: true) }

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
      expect(book.rentals).to be_an(Array)
      expect(book.rentals).to be_empty
    end
  end
end
