require_relative 'person'
class Teacher < Person
  attr_accessor :specialization

  def initialize(age, name, specialization, permission: true)
    super(age, name, parent_permission: permission)
    @specialization = specialization
  end

  def can_use_service?
    true
  end
end
