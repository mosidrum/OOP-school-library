require_relative 'teacher'
class TeacherCreator
  def create
    print 'Enter name of the teacher: '
    name = gets.chomp
    print 'Enter the age of the teacher: '
    age = gets.chomp.to_i
    print 'Enter his/her specialization: '
    specialization = gets.chomp
    Teacher.new(age, specialization, name)
  end
end
