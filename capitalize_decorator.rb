require_relative 'base_decorator'

# Implement a method correct_name that capitalizes the output of @nameable.correct_name.
class CapitalizeDecorator < BaseDecorator
  def correct_name
    super.capitalize
  end
end
