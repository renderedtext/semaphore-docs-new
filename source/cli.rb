module CLI
  module_function

  def self.structure
    JSON.parse(File.read("cli_structure.json"))
  end

  def self.page_title(namespace)
    namespace["name"]
      .split("-")
      .map(&:capitalize)
      .join(" ")
  end

  def self.toc(namespace)
    list = all_commands_in_namespace(namespace).map do |cmd|
      title = cmd["desc"].capitalize
      href = cmd["desc"].split(" ").join("-")

      "<li><a href='##{href}'>#{title}</a></li>"
    end

    "<ol type='i'>#{list.join("\n")}</ol>"
  end

  def self.flags_table(command)
    header = [
      ["Flag", "Description"],
      ["----", "-----------"]
    ]

    data = command["flags"].map do |f|
      flag = []
      flag << "-#{f["alias"]}" if f["alias"]
      flag << "--#{f["name"]}"
      flag = flag.join(", ")

      description = []
      description << "__required__" if f["required"]
      description << "default: #{f["default"]}" if f["default"]
      description = description.join(", ")

      description = f["desc"] + ".<br>" + description if f["desc"] != ""

      [flag, description]
    end

    rows = (header + data).map { |row| "| #{row.join(" | ")} |" }

    "\n" + rows.join("\n") + "\n"
  end

  def all_commands_in_namespace(namespace)
    nested_commands = namespace["namespaces"].map do |ns|
      all_commands_in_namespace(ns)
    end.flatten

    namespace["commands"] + nested_commands
  end
end
