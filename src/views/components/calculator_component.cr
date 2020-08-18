class CalculatorComponent < Motion::Base
  props buffer : String = ""
  props buffering : Bool = false
  props next_number : Bool = false
  props op : String?
  props operand_one : Float = 0.0
  props map_motion : Bool = true

  @[Motion::MapMethod]
  def add_char(event : Motion::Event)
    str = event.target.data[:char]

    unless buffering?
      @buffer = ""
      @buffering = true
    end

    if next_number?
      @buffer = str.to_s
      @next_number = false
    else
      @buffer += str.to_s
    end
  end

  @[Motion::MapMethod]
  def operation(event : Motion::Event)
    @operand_one = buffer.to_f
    @op = event.target.data[:op].to_s
    @next_number = true
  end

  @[Motion::MapMethod]
  def change_sign
    amt = (buffer.to_f * -1)
    @buffer = drop_decimals(amt).to_s
  end

  @[Motion::MapMethod]
  def percent
    amt = (buffer.to_f / 100.0)
    @buffer = drop_decimals(amt).to_s
  end

  @[Motion::MapMethod]
  def equals
    total =
      case op
      when "+"
        operand_one + buffer.to_f
      when "-"
        operand_one - buffer.to_f
      when "*"
        operand_one * buffer.to_f
      when "/"
        operand_one / buffer.to_f
      end

    @buffer = drop_decimals(total).to_s

    @buffering = false
  end

  @[Motion::MapMethod]
  def clear
    @buffering = false
    @op = nil
    @operand_one = 0.0
    @buffer = "0"
    @next_number = false
  end

  private def drop_decimals(num)
    if num && num == num.to_i
      num.to_i
    else
      num
    end
  end

  def render
    div class: "calc-grid" do
      div class: "buffer buffer-area" { text buffer() }

      button class: "number-btn", data_motion: "clear" { text "C" }
      button class: "number-btn", data_motion: "change_sign" { text "+/-" }
      button class: "number-btn", data_motion: "percent" { text "%" }
      button class: "op-btn", data_motion: "operation", data_op: "/" { text "÷" }

      button class: "number-btn", data_motion: "add_char", data_char: "7" { text "7" }
      button class: "number-btn", data_motion: "add_char", data_char: "8" { text "8" }
      button class: "number-btn", data_motion: "add_char", data_char: "9" { text "9" }
      button class: "op-btn", data_motion: "operation", data_op: "*" { text "X" }

      button class: "number-btn", data_motion: "add_char", data_char: "4" { text "4" }
      button class: "number-btn", data_motion: "add_char", data_char: "5" { text "5" }
      button class: "number-btn", data_motion: "add_char", data_char: "6" { text "6" }
      button class: "op-btn", data_motion: "operation", data_op: "-" { text "-" }

      button class: "number-btn", data_motion: "add_char", data_char: "1" { text "1" }
      button class: "number-btn", data_motion: "add_char", data_char: "2" { text "2" }
      button class: "number-btn", data_motion: "add_char", data_char: "3" { text "3" }
      button class: "op-btn", data_motion: "operation", data_op: "+" { text "+" }

      button class: "number-btn zero-butto", data_motion: "add_char", data_char: "0" { text "0" }
      button class: "number-btn", data_motion: "add_char", data_char: "." { text "." }
      button class: "op-btn", data_motion: "equals" { text "=" }
    end
  end
end