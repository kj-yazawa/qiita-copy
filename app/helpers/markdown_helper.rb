module MarkdownHelper
  def markdown(text)
    unless @markdown
      options = {
        # no_intra_emphasis: true,
        # tables: true,
        # fenced_code_blocks: true,
        # autolink: true,
        # disable_indented_code_blocks: true,
        # strikethrough: true,
        # lax_spacing: true,
        # space_after_headers: true,
        # underline: true,
        # highlight: true,
        # hard_wrap: true,
        # filter_html: true,
        # xhtml: true,
      }
      renderer = Redcarpet::Render::HTML.new(options)
      @markdown = Redcarpet::Markdown.new(renderer)
    end

    @markdown.render(text).html_safe
  end
end
