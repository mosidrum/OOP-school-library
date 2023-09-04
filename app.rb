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
    teacher = TeacherCreator.new.create
    @people << teacher
    puts 'Teacher was created successfully'
  end

  def create_student
    student = StudentCreator.new.create
    @people << student
    puts 'Student created successfully'
  end

  def create_book
    book = BookCreator.new.create
    @books << book
    puts 'Book created successfully'
  end

  def list_rentals
    puts 'Enter the Id of the person: '
    input_id = gets.chomp.to_i
    person = find_person_by_id(input_id)

    if person
      person.list_rentals
    else
      puts "No person with Id #{input_id} found in the library"
    end
  end

  def create_rental
    rental = RentalCreator.new.create(@people, @books, @date)
    if rental
      @rentals << rental
      puts "Rent created successfully."
    else
      puts 'Rent creation failed.'
    end
  end

  def find_person_by_id(id)
    @people.find {|person| person.id == id}
  end
end

