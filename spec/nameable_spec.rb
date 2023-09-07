require 'spec_helper'

require_relative '../nameable'

RSpec.describe Nameable do
  describe '#correct_name' do
    it 'raises NotImplementedError' do
      nameable = Nameable.new

      expect { nameable.correct_name }.to raise_error(NotImplementedError, 'Please implement the correct name_method.')
    end
  end
end
