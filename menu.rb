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
end
