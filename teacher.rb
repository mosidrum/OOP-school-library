# frozen_string_literal: true

# Represents a teacher with specific attributes and
class Teacher < Person
  attr_accessor :specialization

  def initialize(age, specialization, name, permission: true)
    super(age, name, parent_permission: permission)
    @specialization = specialization
  end

  def can_use_service?
    true
  end
end
