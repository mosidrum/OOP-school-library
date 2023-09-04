require_relative 'book'
class BookCreator
  def create
    print 'Enter the title of the book: '
    title = gets.chomp
    print 'Enter name of author: '
    author = gets.chomp
    Book.new(title, author)
  end
end
