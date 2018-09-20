require 'net/http'
class ExtractorService
  attr_accessor :url, :uri

  def initialize(param)
    @url = params[:attributes][:url]
    @uri = URI(@url)
  end

  def extractContent(params)
    response = Net::HTTP.get(uri)
    puts response
  end
end
