require 'net/http'

module Api::V1
  class ExtractorsController < ApiController
    def create
      a_tag_regex = /<[a][^>]*>(.+?)<\/[a]>/
      h_Regex = /<[h]\d[^>]*>(.+?)<\/[h]\d>/
      link_regex = /(?<=href=\")(http(s)?:\/\/(.*?))(?=\")/

      uri = URI(extractor_params[:attributes][:url])
      response = Net::HTTP.get(uri)
      response.scan(link_regex)

      links = response.scan(link_regex).map do |single|
        single[0]
      end

      @extractor = Extractor.new(extractor_params)
      if @extractor.save
        render status: :created
      else
        render json: @extractor.errors, status: :unprocessable_entity
      end
    end

    private
      def extractor_params
        params.require(:data).permit(attributes: :url)
      end
  end
end