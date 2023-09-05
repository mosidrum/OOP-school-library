require_relative '../student'
require_relative '../classroom'

describe Student do
  let(:student) { Student.new(16, 'John Doe', true) }
  let(:classroom) { Classroom.new('Math 101') }

  describe '#initialize' do
    it 'creates a new student with the given age, name, and parent permission' do
      expect(student.age).to eql(16)
      expect(student.name).to eql('John Doe')
      expect(student.parent_permission).to be true
    end
  end

  describe '#classroom=' do
    it 'sets the classroom for the student' do
      student.classroom = classroom
      expect(student.classroom).to eql(classroom)
    end

    it 'adds the student to the classroom' do
      student.classroom = classroom
      expect(classroom.students).to include(student)
    end

    it 'does not add the student to the classroom if already included' do
      classroom.students << student
      student.classroom = classroom
      expect(classroom.students.count(student)).to eql(1)
    end
  end

  describe '#play_hooky' do
    it 'returns emoji' do
      expect(student.play_hooky).to eql('¯\(ツ)/¯')
    end
  end
end
