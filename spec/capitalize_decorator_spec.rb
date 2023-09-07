require 'spec_helper'

require_relative '../capitalize_decorator'

RSpec.describe CapitalizeDecorator do
  describe '#correct_name' do
    it 'handles the capitalize the correct_name' do
      nameable = double(Nameable)
      allow(nameable).to receive(:correct_name).and_return('jalloh')

      decorator = CapitalizeDecorator.new(nameable)
      result = decorator.correct_name

      expect(nameable).to have_received(:correct_name)
      expect(result).to eq('Jalloh')
    end

    it 'handles already the capitalize name' do
      nameable = double(Nameable)
      allow(nameable).to receive(:correct_name).and_return('Isaac')
      decorator = CapitalizeDecorator.new(nameable)
      result = decorator.correct_name
      expect(nameable).to have_received(:correct_name)
      expect(result).to eq('Isaac')
    end
  end
end
