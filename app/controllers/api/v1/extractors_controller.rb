# frozen_string_literal: true

require "net/http"

module Api::V1
  class ExtractorsController < ApiController
    def create
      # service = ExtractorService.new(extractor_params)
      # service.extract_contents
      @extractor = Extractor.create(extractor_params)
      if @extractor.valid?
        render json: serialize_resource(ExtractorResource, @extractor, nil), status: :created
      else
        jsonapi_render_errors json: @extractor, status: :unprocessable_entity
      end
    end

    private
      def extractor_params
        params
          .require(:data)
          .require(:attributes)
          .permit(:url)
      end
  end
end
