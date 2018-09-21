# frozen_string_literal: true

class Docs::V1::ExtractorsController
  include Swagger::Blocks

  swagger_path "/extractors" do
    operation :get do
      key :sumary, "Get all urls"
      key :description, "Returns all stored urls"
      key :operationId, "indexExtractors"
      key :produces, [
        "application/json"
      ]
      key :tags, [
        "Extractor"
      ]
      response 200 do
        key :description, "extractor response"
      end
    end
    operation :post do
      key :description, "Creates a new extractor."
      key :operationId, "createExtractor"
      key :produces, [
        "application/vnd.api+json"
      ]
      key :tags, [
        "Extractor"
      ]
      parameter do
        key :in, :body
        key :name, :data
        key :description, "Create a extraction from url link, store a url link"
        key :required, true
        schema do
          key :'$ref', :ExtractorInput
        end
      end
      response 200 do
        key :description, "extractor response"
        schema do
          key :'$ref', :ExtractorInclude
        end
      end
    end
  end
end
