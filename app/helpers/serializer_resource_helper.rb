# frozen_string_literal: true

module SerializerResourceHelper
  def serialize_with_include_resource(resource, object, params, includes)
    JSONAPI::ResourceSerializer.new(resource, include: includes).serialize_to_hash(resource.new(object, params))
  end

  def serialize_resource(resource, object, params)
    JSONAPI::ResourceSerializer.new(resource).serialize_to_hash(object)
  end
end
