require_relative 'nameable'
require_relative 'capitalize_decorator'
require_relative 'trimmer_decorator'

# Represents a person with a name, age, and optional parent permission.
class Person < Nameable
  attr_accessor :name, :age, :parent_permission, :rentals
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = rand(1..1000)
    @name = name
    @age = age
    @rentals = []
    @parent_permission = parent_permission
    super()
  end

  def correct_name
    @name
  end

  def can_use_service?
    return true if of_age? || @parent_permission

    false
  end

  def add_rental(rental)
    @rentals << rental
  end

  def list_rentals
    if @rentals.empty?
      puts "No rentals for #{@name}"
    else
      puts "#{@name}'s rentals:"
      @rentals.each do |rental|
        puts "Book: #{rental.book.title} by #{rental.book.author} on Date: #{rental.date}"
      end
    end
  end

  private

  def of_age?
    return true if @age >= 18

    false
  end
end
