# frozen_string_literal: true

class Api::V1::ContentResource < JSONAPI::Resource
  attributes :tag, :content

  has_one :extractor
end
