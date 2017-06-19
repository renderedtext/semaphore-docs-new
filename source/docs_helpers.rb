module DocsHelpers
  def toc
    content = ::File.read(current_page.source_file)

    # remove YAML frontmatter
    content = content.gsub(/^(---\s*\n.*?\n?)^(---\s*$\n?)/m,'')

    markdown = Redcarpet::Markdown.new(
      Redcarpet::Render::HTML_TOC.new(nesting_level: 3)
    )

    html_list = markdown.render(content)

    html_list.gsub("<ul>", "<ol type='i'>").gsub("</ul>", "</ol>")
  end
end
