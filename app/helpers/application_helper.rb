module ApplicationHelper
  def pluralize(count, one, many)
    return count > 1 ? many : one
  end
end
