# frozen_string_literal: true

module SerializerResourceHelper
  def serialize_resource(resource, object, params, includes)
    JSONAPI::ResourceSerializer.new(resource, include: includes).serialize_to_hash(resource.new(object, params))
  end
end
