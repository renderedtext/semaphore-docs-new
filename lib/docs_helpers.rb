module DocsHelpers

  def page_tagged?(tag_name)
    !current_page.data.tags.nil? && current_page.data.tags.include?(tag_name)
  end
end
