# Represents a student with specific attributes and behaviors
class Student < Person
  attr_accessor :classroom

  def initialize(age, classroom, name, parent_permission)
    super(age, name, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end
end
