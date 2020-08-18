require "jasper_helpers"

class ApplicationController < Amber::Controller::Base
  include JasperHelpers
  LAYOUT = "application.slang"

  def render(component : Motion::Base.class)
    puts context.request.path
    m(component)
    view.to_s
  end
end
