# frozen_string_literal: true

require "net/http"

module Api
  module V1
    class ExtractorsController < ApiController
      before_action :set_includes, only: [:create]

      def index
        @urls = Extractor.all

        jsonapi_render json: @urls, status: 200
      end

      def create
        @extractor = Extractor.create(extractor_params)
        if @extractor.valid?
          service = ExtractorService.new(extractor_params)
          @extractor.contents.create(service.extract_contents)
          render json: serialize_with_include_resource(ExtractorResource, @extractor, nil, @includes), status: :created
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
        def set_includes
          @includes = ["contents"]
        end
    end
  end
end
