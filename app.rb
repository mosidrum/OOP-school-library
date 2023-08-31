require_relative 'person'
require_relative 'student'
require_relative 'classroom'
require_relative 'rentals'
require_relative 'teacher'
require_relative 'book'

class App
  def initialize
    @rentals = []
    @people = []
    @books = []
  end

  def list_all_people
    puts 'These are all the people in the library: '
    if @people.empty?
      puts 'Nobody visited the library'
    else
      @people.each do |person|
        puts "Id: #{person.id}, Name: #{person.name}, Age: #{person.age}, Class: #{person.class}"
      end
    end
  end

  def list_all_books
    puts 'These are all the books in the library: '
    if @books.empty?
      puts 'No book is in the library'
    else
      @books.each do |book|
        puts " Author: #{book.author}, Title: #{book.title}"
      end
    end
  end

  def create_person
    print 'Press [1] to create a teacher or press [2] to creat a student: '
    input = gets.chomp.to_i
    if input == 1
      create_teacher
    elsif input == 2
      create_student
    else
      'Invalid. Choose [1] to create a teacher or [2] to create a student'
    end
  end

  def create_teacher
    print 'Enter name of the teacher: '
    name = gets.chomp
    print 'Enter the age of the teacher: '
    age = gets.chomp.to_i
    print 'Enter his/her specialization: '
    specialization = gets.chomp
    teacher = Teacher.new(age, specialization, name)
    @people << teacher
    puts 'Teacher was created successfully'
  end

  def create_student
    print 'Enter the name of the student: '
    name = gets.chomp
    print 'Enter the age of the student: '
    age = gets.chomp
    print 'Does the student have parent permission? [Y/N]: '
    parent_permission = gets.chomp
    if parent_permission.downcase == 'y'
      student = Student.new(age, name, false)
    elsif parent_permission.downcase == 'n'
      student = Student.new(age, name, true)
    else
      puts 'Invalid input'
      return
    end
    @people << student
    puts 'Student created successfully'
  end

  def create_book
    print 'Enter the title of the book: '
    title = gets.chomp
    print 'Enter name of author: '
    author = gets.chomp
    book = Book.new(title, author)
    @books << book
    puts 'Book created successfully'
  end

  def list_rentals
    puts 'Enter the Id of the person: '
    input_id = gets.chomp.to_i
    search = @rentals.select { |rent| rent.person.id == input_id }
    if search.empty?
      puts "The person with id #{input_id} has not rented any book"
    else
      puts 'The books rented are:'
      search.each do |x|
        puts "Book: #{x.book.title} by #{x.book.author} on Date: #{x.date}"
      end
    end
  end

  def create_rental
    puts 'Select a book to rent from the list: '
    @books.each_with_index { |book, index| puts "#{index} Title: #{book.title}, Author: #{book.author}" }
    book_index = gets.chomp.to_i

    puts 'Select your name from the following list: '
    @people.each_with_index { |person, index| puts "#{index} Name: #{person.name} Age: #{person.age}" }
    person_index = gets.chomp.to_i

    puts 'Enter date (YYYY-MM-DD): '
    date = gets.chomp

    person = @people[person_index]
    book = @books[book_index]

    rental = Rentals.new(person, book, date)  # Use instances, not indices
    person.add_rental(rental)
    book.add_rental(person, rental)
    @rentals << rental
    puts 'Rent created successfully'
  end
end
