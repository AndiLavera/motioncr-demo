class NavComponent < Motion::Base
  def render
    nav class: "navbar navbar-expand navbar-dark bg-white text-primary mb-3" do
      div class: "container" do
        a class: "navbar-brand logo", href: "/"

        ul class: "navbar-nav mr-auto" do
          li class: "nav-item active" do
            a(class: "nav-link", href: "/") { text "Home" }
          end

          li class: "nav-item active" do
            a(class: "nav-link", href: "/calculator") { text "Calculator" }
          end

          li class: "nav-item active" do
            a(class: "nav-link", href: "/clock") { text "Clock" }
          end

          li class: "nav-item active" do
            a(class: "nav-link", href: "/form_validation") { text "Form Validation" }
          end
        end
      end
    end
  end
end
