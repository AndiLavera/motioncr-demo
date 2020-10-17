class ClockComponent < Motion::Base
  props motion_component : Bool = true
  props timezone : String = "Etc/UTC"
  props time : Time = Time.utc

  HOURS = 12
  MINUTES = 60
  SECONDS = 60
  DEGREES = 360
  DATE_FORMAT = "%I:%M:%S%p"

  @[Motion::PeriodicTimer(interval: 1.second)]
  def tick
    @time = Time.utc

    # stop_periodic_timer :tick if @time >= @to_time
  end

  def timestart_display
    @timestart.to_s(DATE_FORMAT)
  end

  def time_display
    @time.to_s(DATE_FORMAT)
  end

  def duration_display
    distance_of_time_in_words(duration)
  end

  def hour
    time.hour % HOURS
  end

  def hour_rotation
    (hour + minute_percent) * (DEGREES / HOURS).to_f
  end

  def minute_percent
    time.minute / MINUTES.to_f
  end

  def minute_rotation
    time.minute * (DEGREES / MINUTES)
  end

  def second_rotation
    time.second * (DEGREES / SECONDS)
  end

  def render
    div class: "clock-body" do
      div class: "clock" do
        div class: "face" do
          span class: "hands hour shadow-sm", style: "transform: rotate(#{hour_rotation}deg)"
          span class: "hands minute shadow-sm", style: "transform: rotate(#{minute_rotation}deg)"
          span class: "hands second shadow-sm", style: "transform: rotate(#{second_rotation}deg)"
          span class: "center"
        end
      end

      div class: "time-display" do
        para { text "#{time_display} UTC"}
      end
    end
  end
end