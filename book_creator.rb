# frozen_string_literal: true

require_relative 'book'
# rubocop:disable Style/Documentation
class BookCreator
  def create
    print 'Enter the title of the book: '
    title = gets.chomp
    print 'Enter name of author: '
    author = gets.chomp
    Book.new(title, author)
  end
end
# rubocop:enable Style/Documentation
