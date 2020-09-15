class ButtonComponentCopy < Motion::Base
  props text_content : String = "Add"
  props count : Int32 = 0
  props motion_component : Bool = true
  # props on_click : String

  @[Motion::MapMethod]
  def add(event : Motion::Event)
    pp "hit"
    @count += 1
  end

  # def change_text
  #   puts on_click
  #   on_click.call
  # end

  def render
    div do
      span @count.to_s
      button class: "btn btn-primary", data_motion: "click->add" do
        text self.text_content
      end

      button class: "btn btn-primary", data_motion: "click->change_text" do
        text "Change default text"
      end
    end
  end
end
