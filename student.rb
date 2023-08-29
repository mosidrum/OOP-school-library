# Represents a student with specific attributes and behaviors
class Student < Person
  attr_accessor :classroom

  def initialize(age, classroom, name, permission: true)
    super(age, name, parent_permission: permission)
    @classroom = classroom
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end
end
