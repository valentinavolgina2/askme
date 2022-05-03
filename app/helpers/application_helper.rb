module ApplicationHelper
  def pluralize(count, one, many)
    return count > 1 ? many : one
  end

  def navbar_color_style(user)
    navbar_color = user&.setting&.navbar_color

    if navbar_color
      "background-color: #{navbar_color};"
    end
  end
end
