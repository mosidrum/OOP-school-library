require_relative 'person'
require_relative 'student_creator'
require_relative 'classroom'
require_relative 'rental_creator'
require_relative 'teacher_creator'
require_relative 'book_creator'
require_relative 'file_writer'
require_relative 'file_loader'
require 'json'
class App < FileWriter
  def initialize
    super
    @rentals = []
    @people = []
    @books = []
    @book_index = 0

    loaded_books = FileLoader.load_books_from_file
    loaded_books.each do |book_data|
      book = Book.new(book_data['Title'], book_data['Author'], @book_index)
      @books << book
      @book_index += 1
    end

    loaded_people = FileLoader.load_people_from_file
    loaded_people.each do |person_data|
      if person_data['Class'] == 'Teacher'
        person = Teacher.new(person_data['Name'], person_data['Age'], person_data['Specialization'])
      elsif person_data['Class'] == 'Student'
        person = Student.new(person_data['Name'], person_data['Age'], person_data['HasParentPermission'])
      end
      @people << person
    end
  end

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
      if person
        puts "Id: #{person.id}, Name: #{person.name}, Age: #{person.age}, Class: #{person.class}"
      else
        puts 'Invalid person data.'
      end
    end
  end

  def list_all_books
    @books.each_with_index do |book, index|
      puts "S/NO: #{index}, Title: #{book.title}, Author: #{book.author}"
    end
  end

  def list_all_rentals
    loaded_rentals = FileLoader.load_rentals_from_file
    puts 'List of all rentals:'
    loaded_rentals.each_with_index do |rental_data, index|
      person_name = rental_data['Person']
      book_info = rental_data['Book']
      author = rental_data['Author']
      date = rental_data['Date']

      puts "Rental #{index + 1}:"
      puts "Person: #{person_name}"
      puts "Book: #{book_info} by #{author}"
      puts "Date: #{date}"
      puts ''
    end
  end
end
