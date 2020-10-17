class Signup < Granite::Base
  validate_min_length :name, 6
  validate_min_length :email, 6
  validate_min_length :phone, 6

  property name : String = ""
  property email : String = ""
  property phone : String = ""
  timestamps
end
