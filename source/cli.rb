module CLI

  def self.strucure
    JSON.parse(File.load("cli_structure.json"))
  end

end
