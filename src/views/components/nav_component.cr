class NavComponent < Motion::Base
  def render
    nav class: "navbar navbar-expand navbar-dark bg-primary mb-3" do
      div class: "container" do
        a class: "navbar-brand", href: "/" do
          img src: "/dist/images/logo.svg", alt: "Amber logo", height: "30"
        end

        ul class: "navbar-nav mr-auto" do
          li class: "nav-item active" do
            a(class: "nav-link", href: "/") { text "Home" }
          end

          li class: "nav-item active" do
            a(class: "nav-link", href: "/calculator") { text "Calculator" }
          end

          li class: "nav-item active" do
            a(class: "nav-link", href: "/form_validation") { text "Form Validation" }
          end
        end
      end
    end
  end
end
