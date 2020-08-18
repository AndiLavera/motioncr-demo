class Signup < Granite::Base
  validate_min_length :name, 6
  property name : String = ""
  timestamps
end
