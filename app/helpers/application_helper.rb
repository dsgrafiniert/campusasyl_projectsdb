module ApplicationHelper
  def nl2br s
    sanitize(s, tags: []).gsub(/\n/, '<br>').html_safe
  end
end