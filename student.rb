# Represents a student with specific attributes and behaviors

class Student < Person
  attr_reader :classroom

  def initialize(age, _classroom, name, permission: true)
    super(age, name, parent_permission: permission)
  end

  def classroom(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end
end
