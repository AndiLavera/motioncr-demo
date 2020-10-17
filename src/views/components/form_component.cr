class FormComponent < Motion::Base
  props motion_component : Bool = true
  props changed : Array(String) = Array(String).new
  props sign_up : Signup = Signup.new
  props message : String = ""
  props valid_name : String = ""
  props valid_email : String = ""
  props valid_phone : String = ""

  def validate(event)
    inputs = event.form_data.to_s.split("&") # form_data returns `name=input`
    self.sign_up.name = inputs[0].split("=")[1]
    self.sign_up.email = inputs[1].split("=")[1]
    self.sign_up.phone = inputs[2].split("=")[1]

    @saved = false
  end

  @[Motion::MapMethod]
  def valid_name?(event : Motion::Event)
    validate(event)
    @valid_name = @sign_up.name.size >= 6 ? "is-valid" : "is-invalid"
  end

  @[Motion::MapMethod]
  def valid_email?(event : Motion::Event)
    validate(event)
    @valid_email = @sign_up.email.size >= 6 ? "is-valid" : "is-invalid"
  end

  @[Motion::MapMethod]
  def valid_phone?(event : Motion::Event)
    validate(event)
    @valid_phone = @sign_up.phone.size >= 6 ? "is-valid" : "is-invalid"
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
      form url: "/form", data_motion: "submit->save" do
        para class: "text-center" { text @message }
        div class: "form-group" do
          label name: "name", class: "col-form-label" { text "Name" }
          div data_motion: "change->valid_name?" do
            input type: "text", name: "name", class: "form-control #{valid_name}", data_field: "name", value: sign_up.name.to_s
          end

          label name: "email", class: "col-form-label" { text "Email" }
          div data_motion: "change->valid_email?" do
            input type: "text", name: "email", class: "form-control #{valid_email}", data_field: "email", value: sign_up.email.to_s
          end

          label name: "phone", class: "col-form-label" { text "Phone Number" }
          div data_motion: "change->valid_phone?" do
            input type: "text", name: "phone", class: "form-control #{valid_phone}", data_field: "phone", value: sign_up.phone.to_s
          end
        end

        button type: "submit", class: "btn btn-primary" { text "Submit" }
      end
    end
  end
end
