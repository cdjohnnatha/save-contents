require 'net/http'

module Api::V1
  class ExtractorsController < ApiController
    def create
      service = ExtractorService.new(extractor_params)
      service.extract_contents
      # @extractor = Extractor.new(extractor_params)
      # if @extractor.save
      #   render status: :created
      # else
      #   render json: @extractor.errors, status: :unprocessable_entity
      # end
    end

    private
      def extractor_params
        params.require(:data).permit(attributes: :url)
      end
  end
end