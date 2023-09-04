require_relative 'student'
class StudentCreator
  def create
    print 'Enter the name of the student: '
    name = gets.chomp
    print 'Enter the age of the student: '
    age = gets.chomp
    print 'Does the student have parent permission? [Y/N]: '
    parent_permission = gets.chomp
    if parent_permission.downcase == 'y'
      Student.new(age, name, false)
    elsif parent_permission.downcase == 'n'
      Student.new(age, name, true)
    else
      puts 'Invalid input'
      nil
    end
  end
end
