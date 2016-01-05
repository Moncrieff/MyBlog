module ApplicationHelper
  def markdown(post_text)
    Markdown.new(post_text).to_html.html_safe
  end
end
