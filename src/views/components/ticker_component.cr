class TickerComponent < Motion::Base
  props count : Int32 = 0
  props motion_component : Bool = true

  @[Motion::PeriodicTimer(interval: 1.second)]
  def tick
    pp "tick"
    @count += 1
  end

  def render
    div do
      span @count.to_s
    end
  end
end
