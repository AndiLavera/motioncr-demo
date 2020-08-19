abstract class MainLayout < Motion::Base
  def render
    html_doctype
    head do
      css_link "/dist/main.bundle.css"
      utf8_charset
      meta content: "text/html;charset=utf-8", http_equiv: "Content-Type"
      title page_title
    end

    body do
      m NavComponent

      container

      js_link "/dist/main.bundle.js"

      # if Amber.settings.auto_reload?
      #   js_link "/js/client_reload.js"
      # end
    end
    view.to_s
  end

  abstract def container
  abstract def page_title
end
