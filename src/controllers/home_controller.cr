class HomeController < ApplicationController
  def index
    # Render/mount of the top level component fails if that component sets map_motion
    # m will render the html of a single component
    # if that component returns the entire html doc, then transform_html will fail
    # ex:
    # <!DOCTYPE html>
    # <html>
    # </html>
    render HomePage
  end

  def calculator
    render CalculatorPage
  end

  def form_validation
    render FormValidationPage
  end
end
