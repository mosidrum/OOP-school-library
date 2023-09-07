require 'spec_helper'
require_relative '../teacher'

RSpec.describe Teacher do
  let(:teacher) { Teacher.new(35, 'Alice Smith', 'Mathematics') }

  describe '#initialize' do
    it 'creates a new teacher with the given age, name, specialization, and parent permission' do
      expect(teacher.age).to eql(35)
      expect(teacher.name).to eql('Alice Smith')
      expect(teacher.specialization).to eql('Mathematics')
      expect(teacher.parent_permission).to be true
    end
  end

  describe '#can_use_service?' do
    it 'returns true for teachers' do
      expect(teacher.can_use_service?).to be true
    end
  end
end
