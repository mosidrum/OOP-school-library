require_relative 'app'

# menu.rb
class Menu
  def self.menu_list
    puts 'Please enter a number to continue:'
    puts '[1] - Create a Book'
    puts '[2] - Create a Person'
    puts '[3] - Create a Rental'
    puts '[4] - List all Books'
    puts '[5] - List all People'
    puts '[6] - List books rented by a person'
    puts '[7] - End application'

    puts 'Waiting for a prompt from you'
  end

  def self.display(app)
    choices = {
      1 => :create_book,
      2 => :create_person,
      3 => :create_rental,
      4 => :list_all_books,
      5 => :list_all_people,
      6 => :list_all_rentals,
      7 => :end_app
    }

    loop do
      menu_list
      user_input = gets.chomp.to_i

      if choices.key?(user_input)
        case user_input
        when 1
          do_create_book(app)
        when 2
          do_create_person(app)
        when 3
          do_create_rental(app)
        when 4, 5, 6 # Updated the case for option 6
          app.send(choices[user_input])
        when 7
          app.send(choices[user_input])
          break
        end
      else
        puts 'Invalid selection'
      end
    end
  end

  def self.do_create_book(app)
    print 'Enter the title of the book: '
    title = gets.chomp
    print 'Enter the name of the author: '
    author = gets.chomp
    app.create_book(title, author)
    puts 'Book created successfully'
  end

  def self.do_create_person(app)
    print 'Press [1] to create a teacher or press [2] to create a student: '
    input = gets.chomp.to_i
    if input == 1
      do_create_teacher(app)
    elsif input == 2
      do_create_student(app)
    else
      puts 'Invalid choice'
    end
  end

  def self.do_create_teacher(app)
    print 'Enter name of the teacher: '
    name = gets.chomp
    print 'Enter the age of the teacher: '
    age = gets.chomp.to_i
    print 'Enter his/her specialization: '
    specialization = gets.chomp
    app.create_teacher(age, name, specialization)
    puts 'Teacher was created successfully'
  end

  def self.do_create_student(app)
    print 'Enter the name of the student: '
    name = gets.chomp
    print 'Enter the age of the student: '
    age = gets.chomp.to_i
    print 'Does the student have parent permission? [Y/N]: '
    parent_permission = gets.chomp.downcase
    app.create_student(name, age, parent_permission == 'y')
    puts 'Student created successfully'
  end

  def self.do_create_rental(app)
    puts 'Select a book to rent from the list: '
    app.list_all_books

    print 'Enter the index of the book you want to rent: '
    book_index = gets.chomp.to_i

    if book_index.negative? || book_index >= app.instance_variable_get(:@books).length
      puts 'Invalid book index.'
      return
    end

    puts 'Select your name from the following list: '
    app.list_all_people

    print 'Enter the Id of your name: '
    person_id = gets.chomp.to_i

    person = app.instance_variable_get(:@people).find { |p| p.id == person_id }

    if person.nil?
      puts 'Invalid person.'
      return
    end

    print 'Enter the rental date (YYYY-MM-DD): '
    date = gets.chomp
    book = app.instance_variable_get(:@books)[book_index]
    app.create_rental(person, book, date)

    puts 'Rental created successfully'
  end

  def self.do_list_rentals(app)
    app.list_all_rentals
  end
end
