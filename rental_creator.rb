require_relative 'rentals'
require_relative 'book'
require_relative 'person'

class RentalCreator
  def create(people, books)
    puts 'Select a book to rent from the list: '
    books.each_with_index { |book, index| puts "#{index} Title: #{book.title}, Author: #{book.author}" }
    book_index = gets.chomp.to_i

    puts 'Select your name from the following list: '
    people.each_with_index { |person, index| puts "#{index} Name: #{person.name} Age: #{person.age}" }
    person_index = gets.chomp.to_i

    puts 'Enter date (YYYY-MM-DD): '
    date = gets.chomp

    person = people[person_index]
    book = books[book_index]

    Rentals.new(person, book, date)
  end
end
