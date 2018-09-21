class Api::V1::ContentResource < JSONAPI::Resource
  attributes :tag, :content

  belongs_to :extractor
end
