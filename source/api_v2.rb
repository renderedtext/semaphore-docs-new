module ApiV2

  def self.specification
    @api_v2_specs ||= RamlParser.load("api_v2_specification.json")
  end

  def self.sorted_routes(resource)
    [
      resource.index,
      resource.show,
      resource.create,
      resource.update,
      resource.delete,
      resource.connect,
      resource.dissconnect
    ].flatten
  end

  def self.toc(routes)
    list = routes.map do |route|
      href = route.display_name.split(" ").map(&:downcase).join("-")

      "<li><a href='##{href}'>#{route.display_name}</a></li>"
    end

    "<ol type='i'>#{list.join("\n")}</ol>"
  end

  def self.request_table(request)
    header = [
      ["Name", "Type", "Required", "Example"],
      ["----", "----", "--------", "-------"]
    ]

    data = request.properties.map do |f|
      [f.name, f.type, f.required?, f.example]
    end

    rows = (header + data).map { |row| "| #{row.join(" | ")} |" }

    "\n" + rows.join("\n") + "\n"
  end

  def self.response_example(route)
    header = "HTTP status: #{route.succesfull_response.code}"

    if route.succesfull_response.example
      example = JSON.pretty_generate(route.succesfull_response.example)

      fenced_code(header + "\n\n" + example)
    else
      fenced_code(header)
    end
  end

  def self.fenced_code(content, language = "json")
    "\n\`\`\` #{language}\n#{content}\n\`\`\`\n"
  end

end
