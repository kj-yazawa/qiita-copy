module MarkdownHelper
  def markdown(text)
    unless @markdown
      render_options = {
        filter_html: true,
        hard_wrap: true,
        xhtml: true,
        prettify: true,
        link_attributes: true,
      }
      extensions = {
        no_intra_emphasis: true, # 単語の中の強調を解析しない
        tables: true, # PHP-Markdown スタイルのテーブルをパースする
        fenced_code_blocks: true, # PHP-Markdown スタイルのフェンス付きコードブロックをパースする
        autolink: true, # リンクが <> 文字で囲まれていない場合でもパースする
        disable_indented_code_blocks: true, # インデント4つで始まるコードブロックをパースしない
        strikethrough: true, #
        lax_spacing: true,
        space_after_headers: true,
        underline: true,
        highlight: true,
      }
      renderer = Redcarpet::Render::HTML.new(render_options)
      @markdown = Redcarpet::Markdown.new(renderer, extensions)
    end

    @markdown.render(text).html_safe
  end
end
