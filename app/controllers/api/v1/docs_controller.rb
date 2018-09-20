# frozen_string_literal: true

require "dotenv/load"

module Api::V1
  class DocsController < ApplicationController
    # skip_before_action :authenticate_user
    # skip_load_and_authorize_resource
    include Swagger::Blocks

    swagger_root do
      key :swagger, "2.0"
      info do
        key :version, "1.0.0"
        key :title, "Swagger Docs Extractor API"
        key :description, "Documentation for save-contents api "
        key :termsOfService, "http://helloreverb.com/terms/"
        contact do
          key :name, "Extractor API"
        end
        license do
          key :name, "MIT"
        end
      end
      tag do
        key :name, "Extractor API"
        key :description, "Extractor API operations"
      end
      key :host, ENV["DOCS_HOST"]
      key :basePath, "/api/v1"
      key :consumes, ["application/json"]
      key :produces, ["application/json"]
    end

    # A list of all classes that have swagger_* declarations.
    SWAGGERED_CLASSES = [
      Docs::Extractor,
      Docs::V1::ExtractorsController,
      self,
    ].freeze

    def index
      swagger_data = Swagger::Blocks.build_root_json(SWAGGERED_CLASSES)
      File.open("#{Rails.root}/public/swagger.json", "wb") { |file| file.write(swagger_data.to_json) }
      redirect_to "/api-docs.html?url=swagger.json"
    end
  end
end
