# frozen_string_literal: true

class Docs::Extractor
  include Swagger::Blocks

  swagger_schema :Extractor do
    key :required, [:data]

    property :data do
      key :format, :object
      key :required, [:id, :type]

      property :id do
        key :type, :integer
      end

      property :type do
        key :type, :string
      end

      property :attributes do
        key :format, :object
        key :required, [:id, :url]
        property :id do
          key :type, :integer
        end

        property :url do
          key :type, :string
        end
      end
    end
  end

  swagger_schema :ExtractorInput do
    key :required, [:data]

    property :data do
      key :format, :object
      key :required, [:type, :attributes]
      property :type do
        key :type, :string
      end
      property :attributes do
        key :format, :object
        key :required, [:url]
        property :url do
          key :type, :string
        end
      end
    end
  end
end
