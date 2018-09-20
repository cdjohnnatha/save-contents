require 'net/http'

module Api::V1
  class ExtractorsController < ApiController
    def create
      service = ExtractorService.new(extractor_params)
      service.extract_contents
      @extractor = Extractor.new(extractor_params)
      if @extractor.save
        render json: serialize_resource(ExtractorResource, @extractor, nil), status: :created
        # JSONAPI::ResourceSerializer.new(ExtractorResource).serialize_to_hash(ExtractorResource.new(@extractor, nil)), status: :created
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