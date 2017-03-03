# Create a service that will consult Wikipedia
class WikipediaConsulter
  require 'wikipedia'

  def self.find_by_name(param)
    Wikipedia.find(param)
  end

end
