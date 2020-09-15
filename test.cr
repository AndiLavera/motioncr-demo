require "json"

class Test
  include JSON::Serializable
  @[JSON::Field(key: "count")]
  property count : Int32 = 0

  def initialize(*args, **named_args)
    pp "hit"
  end
end

pp Test.new.to_json
pp Test.from_json("{\"count\":10}")
