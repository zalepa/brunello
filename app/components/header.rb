# frozen_string_literal: true

class Components::Header < Components::Base
  # Consider moving to Components::Base
  module CSS
    COAL_LINK = "text-brunello-coal hover:underline hover:underline-offset-4"
    AUTH_LINK = "text-brunello-coal uppercase px-3"
    BADGE = "inline-block bg-brunello-rust text-white text-xs font-semibold rounded-full px-2 py-1 flex items-center justify-center"
  end

  def user_navbar
    link_to "Today", today_path, class: CSS::COAL_LINK
    link_to "All Tasks", tasks_path, class: CSS::COAL_LINK
    if current_user.overdue.any?
      link_to tasks_path(before: Date.today, completed: false), class: CSS::COAL_LINK + "flex items-center space-x-1" do
        span { "Overdue" }
        span(class: CSS::BADGE) { current_user.overdue.count }
      end
    end
  end

  def unauthenticated_home_link
    link_to "Home", root_path, class: CSS::COAL_LINK
  end

  def auth_nav
    if user_signed_in?
      button_to "Logout", destroy_user_session_path, method: :delete, class: CSS::AUTH_LINK
    else
      link_to "Login", new_user_session_path, class: CSS::AUTH_LINK
      link_to "Sign Up", new_user_registration_path, class: CSS::AUTH_LINK
    end
  end

  def view_template
    header(class: "container px-1 py-3 mx-auto mb-6 border border-brunello-plant border-t-0 bg-brunello-seafoam") {
      nav(class: "flex justify-between items-center uppercase font-bold") {
        div(class: "flex items-center space-x-4") {
          link_to "Brunello", root_path, class: "text-brunello-seaform-dark px-3 text-lg"
          user_navbar if user_signed_in?
          unauthenticated_home_link unless user_signed_in?
        }

        div(class: "flex items-center space-x-4") {
          auth_nav
        }
      }
    }
  end
end
