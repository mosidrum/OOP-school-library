require_relative 'nameable'
require_relative 'capitalize_decorator'
require_relative 'trimmer_decorator'

# Represents a person with a name, age, and optional parent permission.
class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = rand(1..1000)
    @name = name
    @age = age
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

  private

  def of_age?
    return true if @age >= 18

    false
  end

  def add_rental(rental)
    @rentals << rental
    rental.person = self
  end
end
