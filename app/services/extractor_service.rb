require 'net/http'
class ExtractorService
  attr_accessor :url, :uri, :full_content, :links_arr, :h_contents

  def initialize(param)
    @url = param[:attributes][:url]
    @uri = URI(@url)
    @full_content = Net::HTTP.get(@uri)
  end

  def extract_links
    link_regex = /(?<=href=\")(http(s)?:\/\/(.*?))(?=\")/

    @links_arr = @full_content.scan(link_regex).map { |single| single[0] }
  end

  def extract_h_contents
    h_regex = /<[h]\d[^>]*>(.+?)<\/[h]\d>/

    @h_contents = @full_content.scan(h_regex).map { |single| single[0] }
  end

  def extract_a_tag
    a_tag_regex = /<[a][^>]*>(.+?)<\/[a]>/

    @full_content.scan(h_regex).map { |single| single[0] }
  end
end
