require_relative 'person'
require_relative 'student_creator'
require_relative 'classroom'
require_relative 'rental_creator'
require_relative 'teacher_creator'
require_relative 'book_creator'
class App
  def initialize
    @rentals = []
    @people = []
    @books = []
    @book_index = 0
  end

  def create_book(title, author)
    book = Book.new(title, author, @book_index)
    @books << book
    @book_index += 1
    book
  end

  def create_teacher(name, age, specialization)
    teacher = Teacher.new(name, age, specialization)
    @people << teacher
    teacher
  end

  def create_student(name, age, has_parent_permission)
    student = Student.new(age, name, has_parent_permission)
    @people << student
    student
  end

  def create_rental(person, book, date)
    rental = Rentals.new(person, book, date)
    person.add_rental(rental)
    book.add_rental(person, rental)
    @rentals << rental
    rental
  end

  def list_all_people
    @people.each do |person|
      puts "Id: #{person.id}, Name: #{person.name}, Age: #{person.age}, Class: #{person.class}"
    end
  end

  def list_all_books
    @books.each do |book|
      puts "S/NO: #{book.index}, Author: #{book.author}, Title: #{book.title}"
    end
  end

  def list_rentals_by_person(person_id)
    search = @rentals.select { |rent| rent.person.id == person_id }
    search.each do |rent|
      puts "Book: #{rent.book.title} by #{rent.book.author} was rented on Date: #{rent.date}"
    end
  end
end
