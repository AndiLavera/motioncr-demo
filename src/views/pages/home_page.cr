class HomePage < ContainerComponent
  def inner
    div do
      m(ButtonComponent, count: 10, text_content: "Click Me")
      h2 "Motioncr Demo"
      para "Motion is a framework for building reactive, real-time frontend UI components in your Amber application using pure Crystal that are reusable, testable & encapsulated."

      div class: "list-group" do
        a(class: "list-group-item list-group-item-action", href: "https://github.com/andrewc910/motion.cr") { text "Getting Started with Motion.cr" }
        a(class: "list-group-item list-group-item-action", href: "https://andrewc910.github.io/motion.cr/Motion.html") { text "API Documentation" }
      end

      div do
        para "This periodic timer has been running for ", style: "display: inline;"
        m(TickerComponent)
        para " seconds", style: "display: inline;"
      end
    end
  end

  def page_title
    "Motioncr Demo"
  end
end
