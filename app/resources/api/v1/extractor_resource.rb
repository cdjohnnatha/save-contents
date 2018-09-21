# frozen_string_literal: true

module Api::V1
  class ExtractorResource < JSONAPI::Resource
    attributes :url

    has_many :contents
  end
end
