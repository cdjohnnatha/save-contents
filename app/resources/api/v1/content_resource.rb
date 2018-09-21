# frozen_string_literal: true

module  Api
  module V1
    class ContentResource < JSONAPI::Resource
      attributes :tag, :content

      has_one :extractor
    end
  end
end
