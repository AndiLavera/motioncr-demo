abstract class ContainerComponent < MainLayout
  def container
    div class: "container" do
      div class: "main" do
        div class: "row justify-content-center" do
          div class: "col-sm-12 col-md-6" do
            inner
          end
        end
      end
    end
  end

  abstract def inner
end
