require 'spec_helper'

require_relative '../base_decorator'

RSpec.describe BaseDecorator do
  describe '#initialize' do
    it 'initializes with a nameable object' do
      nameable = double('Nameable')
      decorator = BaseDecorator.new(nameable)

      expect(decorator.instance_variable_get(:@nameable)).to eq(nameable)
    end
  end

  describe '#correct_name' do
    it 'delegates the correct_name to the decorated object' do
      nameable = double('Nameable')
      allow(nameable).to receive(:correct_name).and_return('John Doe')

      decorator = BaseDecorator.new(nameable)

      result = decorator.correct_name

      expect(nameable).to have_received(:correct_name)
      expect(result).to eq('John Doe')
    end
  end
end
