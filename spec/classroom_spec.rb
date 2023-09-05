require_relative '../classroom'

describe Classroom do
  let(:classroom) { Classroom.new('Mathematics') }

  describe '#initialize' do
    it 'creates a new classroom with the given label and an empty list of students' do
      expect(classroom.label).to eql('Mathematics')
      expect(classroom.students).to be_an(Array)
      expect(classroom.students).to be_empty
    end
  end

  describe '#add_student' do
    it 'adds a student to the classroom and updates the student with the classroom' do
      student = double('Student')
      
      expect(student).to receive(:classroom=).with(classroom)
      classroom.add_student(student)

      expect(classroom.students).to include(student)
    end
  end
end
