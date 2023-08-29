require_relative 'base_decorator'

# Implement a method that makes sure that the output of @nameable.correct_name has a maximum of 10 characters
class TrimmerDecorator < BaseDecorator
  def correct_name
    super[0..9]
  end
end
