# frozen_string_literal: true

require "net/http"
class ExtractorService
  attr_accessor :uri, :full_content, :links_regex, :h_regex, :a_tag_regex

  def initialize(param)
    @uri = URI(param[:url])
    @links_regex = /(?<=href=\")(http(s)?:\/\/(.*?))(?=\")/
    @h_regex = /<[h]\d[^>]*>(.+?)<\/[h]\d>/
    @a_tag_regex = /<[a][^>]*>(.+?)<\/[a]>/
  end

  def extract_contents
    @full_content = Net::HTTP.get(@uri)
    arr = extract_links
    [arr << extract_h_contents].flatten
  end

  private
    def extract_links
      @full_content.scan(@links_regex).map do |single|
        { tag: 1, content: single[0].to_str }
      end
    end

    def extract_h_contents
      @full_content.scan(@h_regex).map do |single|
        { tag: 0, content: single[0].to_str }
      end
    end

    def extract_a_tag
      @full_content.scan(@a_tag_regex).map { |single| single[0] }
    end
end
