class HomePage < ContainerComponent
  props foo : String = "Default"

  include Amber::Controller::Helpers::Render

  def do_something
    foo = "Amber"
  end

  def inner
    div do
      render("ecr/test.ecr", layout: false)
      m(ButtonComponent, count: 10, text_content: "hello")
      h2 "Welcome to #{foo} Framework!"
      para "Thank you for trying out the Amber Framework.  We are working hard to provide a super fast and reliable framework that provides all the productivity tools you are used to without sacrificing the speed."
      div class: "list-group" do
        a(class: "list-group-item list-group-item-action") { text "Getting Started with Amber Framework" }
        a(class: "list-group-item list-group-item-action") { text "List of Awesome Crystal projects and shards" }
        a(class: "list-group-item list-group-item-action") { text "What's hot in Crystal right now" }
      end
      m(ButtonComponent)
      m(TickerComponent)
    end
  end

  def page_title
    "Motioncr Demo"
  end
end
