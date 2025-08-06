class Components::AlertPanel < Components::Base
  register_value_helper :notice
  register_value_helper :alert

  module CSS
    PANEL = "md:w-1/2 md:mx-auto m-3 px-4 py-3 rounded relative "
  end

  def notice_panel
    div(class: CSS::PANEL + "bg-blue-200 border-blue-800 text-blue-800", role: "alert") do
      span(class: "block sm:inline") do
        notice
      end
    end
  end

  def alert_panel
    div(class: CSS::PANEL + "bg-rose-200 border-rose-800 text-rose-800", role: "alert") do
      span(class: "block sm:inline") do
        alert
      end
    end
  end

  def view_template
    notice_panel if notice
    alert_panel if alert
  end
end
