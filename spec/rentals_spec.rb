require_relative '../rentals'

describe Rentals do
  let(:person) { double('Person') }
  let(:book) { double('Book') }
  let(:rental_date) { '2023-09-01' }
  let(:rental) { Rentals.new(person, book, rental_date) }

  describe '#initialize' do
    it 'creates a new rental with the given person, book, and date' do
      expect(rental.date).to eql(rental_date)
      expect(rental.person).to eql(person)
      expect(rental.book).to eql(book)
    end

    it 'adds the rental to the person' do
      expect(person).to receive(:add_rental).with(rental)
      Rentals.new(person, book, rental_date)
    end

    it 'adds the rental to the book' do
      expect(book).to receive(:add_rental).with(person, rental)
      Rentals.new(person, book, rental_date)
    end
  end
end
