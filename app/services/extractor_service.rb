require 'net/http'
class ExtractorService
  attr_accessor :url, :uri, :full_content, :links_arr, :links_regex, :h_regex, :a_tag_regex

  def initialize(param)
    @url = param[:attributes][:url]
    @uri = URI(@url)
    @full_content = Net::HTTP.get(@uri)
    @links_regex = /(?<=href=\")(http(s)?:\/\/(.*?))(?=\")/
    @h_regex = /<[h]\d[^>]*>(.+?)<\/[h]\d>/
    @a_tag_regex = /<[a][^>]*>(.+?)<\/[a]>/
  end

  def extract_contents
    arr = extract_links
    [arr << extract_h_contents].flatten
  end

  private
    def extract_links
      @full_content.scan(@links_regex).map do |single|
        "{ type: 'LINK', content: '#{single[0]}'}"
      end
    end

    def extract_h_contents
      @full_content.scan(@h_regex).map do |single|
        "{ type: 'H', content: '#{single[0]}'}"
      end
    end

    def extract_a_tag
      @full_content.scan(@a_tag_regex).map { |single| single[0] }
    end
end
