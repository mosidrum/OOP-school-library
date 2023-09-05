require_relative 'person'
require_relative 'student_creator'
require_relative 'classroom'
require_relative 'rental_creator'
require_relative 'teacher_creator'
require_relative 'book_creator'
require_relative 'file_writer'
require 'json'
class App < FileWriter
  def initialize
    @rentals = []
    @people = []
    @books = []
    @book_index = 0
    # load_data_from_files
  end

  # def load_data_from_files
  #   @books = FileLoader.load_books
  #   @people = FileLoader.load_people
  #   @rentals =FileLoader.load_rentals(@people, @books)
  #   @book_index = @books.map(&:index).max.to_i + 1
  # end

  def create_book(title, author)
    book = Book.new(title, author, @book_index)
    @books << book
    write_book_to_file(book)
    @book_index += 1
    book
  end

  def create_teacher(name, age, specialization)
    teacher = Teacher.new(name, age, specialization)
    @people << teacher
    write_person_to_file(teacher)
    teacher
  end

  def create_student(name, age, has_parent_permission)
    student = Student.new(age, name, has_parent_permission)
    @people << student
    write_person_to_file(student)
    student
  end

  def create_rental(person, book, date)
    rental = Rentals.new(person, book, date)
    person.add_rental(rental)
    book.add_rental(person, rental)
    @rentals << rental
    write_rental_to_file(rental)
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

  # def book_to_json(book)
  #   {
  #     "index": book.index,
  #     "author": book.author,
  #     "title": book.title
  #   }.to_json
  # end
  #
  # def person_to_json(person)
  #   {
  #     "id": person.id,
  #     "name": person.name,
  #     "age": person.age,
  #     "class": person.class
  #   }.to_json
  # end
  #
  # def rental_to_json(rental)
  #   {
  #     "person": person_to_json(rental.person),
  #     "book": book_to_json(rental.book),
  #     "date": rental.date
  #   }.to_json
  # end
end
