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
      6 => :list_rentals,
      7 => :end_app
    }

    loop do
      menu_list
      user_input = gets.chomp.to_i

      if choices.key?(user_input)
        app.send(choices[user_input])
      else
        puts 'Invalid selection'
      end

      break if user_input == 7
    end
  end
end
