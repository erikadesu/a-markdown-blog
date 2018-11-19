module MarkdownHelper
  def markdown(text)

  options = {
    :fenced_code_blocks => true,
    :no_intra_emphasis => true,
    :autolink => true,
    :lax_html_blocks => true,
    :strikethrough => true,
    :space_after_headers => true,
    :superscript => true,
    :underline => true,
    :hightlight => true,
    :quote => true,
    :footnotes => true
  }
  renderer = Redcarpet::Render::HTML.new(filter_html: true, hard_wrap: true)
  markdown_to_html = Redcarpet::Markdown.new(renderer, options)
  markdown_to_html.render(text).html_safe
  end
end
