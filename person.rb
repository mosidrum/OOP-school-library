# Represents a person with a name, age, and optional parent permission.
class Person
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
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
end
