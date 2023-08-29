# Handles error for the name_method
class Nameable
  def correct_name
    raise NotImplementedError, 'Please implement the correct name_method.'
  end
end
