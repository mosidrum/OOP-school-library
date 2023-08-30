require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'classroom'
require_relative 'book'
require_relative 'rentals'

# creating empty array for entities
@people = []
@books = []
@classrooms = []
@rentals = []

# hard coding books
book1 = Book.new('Millionaire in one week', 'Ayodele Isaac')
book2 = Book.new('Anywhere is Nowhere', 'Marcus Smith')
book3 = Book.new('Good times and Bad times', 'Clever Tresphor')

# add the books to the array
@books << book1
@books << book2
@books << book3

# list people
def list_people
  puts 'List of all people'
  @people.each do |each_person|
    puts "Id: #{each_person.id}, Name: #{each_person.name}, Age: #{each_person.age}"
  end
end

# list books
def list_books
  puts 'List of books'
  @books.each do |each_book|
    puts "Author: #{each_book.author}, Title: #{each_book.title}"
  end
end

# creating a student
def create_student(name, age, classroom_label)
  classroom = @classroom.find { |x| x.label == classroom_label }
  unless classroom
    classroom = Classroom.new(classroom_label)
    @classroom << classroom
  end
  student = Student.new(age, classroom, name)
  @people << student
  puts 'Student is created successfully'
end

#creating a book
def create_book
  puts 'Create a book!'
  puts 'Enter title of book:'
  title = gets.chomp
  puts 'Enter author name:'
  author = gets.chomp
  book = Book.new(title, author)
  @books << book
  puts 'Your book is crested successfully'
end

# creating a rental
def create_rental
  puts 'Create a rental'
  puts 'Enter Id of the person:'
  person_id = gets.chomp.to_i
  person = @people.find { |x| x.id = person_id }
  unless person
    puts 'No record for person found'
    return
  end
  puts 'Enter book title:'
  book_title = gets.chomp
  book = @books.find { |x| x.title == book_title }
  unless book
    puts 'No record for book found'
    return
  end
  puts 'Enter date of rent(YYY-MM-DD):'
  date = gets.chomp
  rental = Rental.new(date, person, book)
  @rentals << rental
  puts 'Rental created successfully'
end

def create_teacher(name, age, specialization)
  teacher = Teacher.new(age, name, specialization)
  @people << teacher
  puts 'Teacher created successfully'
end

def list_rentals_for_person
  puts 'Enter person Id:'
  person_id = gets.chomp.to_i
  person = @person.find { |x| x.id == person_id }
  unless person
    puts 'No record for person found'
    return
  end
  rentals = @rentals.select { |x| x.person = person}
  puts "Rentals for #{person.name}:"
  rentals.each do |rent|
    puts "#{rent.book.title} by #{rent.book.author} and date #{rent.date}"
  end
end