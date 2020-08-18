class FormComponent < Motion::Base
  props map_motion : Bool = true
  props changed : Array = Array(String).new
  props is_valid : String = ""
  props sign_up : Signup = Signup.new
  props message : String = ""

  @[Motion::MapMethod]
  def validate(event : Motion::Event)
    name = event.form_data.to_s.split("=")[1] # form_data returns `name=input`
    self.sign_up.name = name
    @saved = false
    @is_valid = (sign_up.valid? ? "is-valid" : "is-invalid")
  end

  @[Motion::MapMethod]
  def save(event : Motion::Event)
    # For demo purposes, don't save anything.
    if @sign_up.valid?
      @saved = true
      @sign_up = Signup.new
      @message = "Sign up has been \"saved\""
      @is_valid = ""
    else
      @message = @sign_up.errors[0].message.to_s
    end
  end

  def render
    div do
      form url: "/form", data_motion: "change->validate submit->save" do
        para class: "text-center" { text @message }
        div class: "form-group row" do
          label name: "name", class: "col-sm-2 col-form-label" { text "name" }
          div class: "col-sm-10" do
            input type: "text", name: "name", class: "form-control #{is_valid}", data_field: "name", value: sign_up.name.to_s
          end
        end

        button type: "submit", class: "btn btn-primary" { text "Submit" }
      end
    end
  end
end
