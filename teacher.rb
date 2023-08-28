# frozen_string_literal: true

require_relative './person'

# Represents a teacher with specific attributes and
class Teacher < Person
  attr_accessor :specialization

  def initialize(age, specialization, name, parent_permission)
    super(age, name, parent_permission)
    @specialization = specialization
  end

  def can_use_service?
    true
  end
end
