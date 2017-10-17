module CLI
  module_function

  def self.structure
    JSON.parse(File.read("cli_structure.json"))
  end

  def self.toc(namespace)
    list = namespace["commands"].map do |cmd|
      title = cmd["desc"]
      href = title.split(" ").join("-")

      "<li><a href='##{href}'>#{title}</a></li>"
    end

    "<ol type='i'>#{list.join("\n")}</ol>"
  end

  def self.options_table(command)
    header = [
      ["Option", "Description"],
      ["------", "-----------"]
    ]

    data = command["options"].map do |opt|
      option = "-#{opt["alias"]}, --#{opt["name"]}"

      desc = ""
      desc += "__required__" if opt["required"]
      desc += "default: #{opt["default"]}" if opt["required"]

      [option, desc]
    end

    rows = (header + data).map { |row| "| #{row.join(" | ")} |" }

    "\n" + rows.join("\n") + "\n"
  end
end
