require 'spec_helper'

require_relative '../trimmer_decorator'

RSpec.describe TrimmerDecorator do
  describe '#correct_name' do
    it 'trims the correct_name to a maximum of 10 characters' do
      nameable = double('Nameable')
      allow(nameable).to receive(:correct_name).and_return('Jalloh Abdourahmane')

      decorator = TrimmerDecorator.new(nameable)

      result = decorator.correct_name

      expect(nameable).to have_received(:correct_name)

      expect(result).to eq('Jalloh Abd')
    end

    it 'handles short names without trimming' do
      nameable = double('Nameable')
      allow(nameable).to receive(:correct_name).and_return('Isaac')

      decorator = TrimmerDecorator.new(nameable)

      result = decorator.correct_name

      expect(nameable).to have_received(:correct_name)

      expect(result).to eq('Isaac')
    end
  end
end
