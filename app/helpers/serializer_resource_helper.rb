module SerializerResourceHelper
  def serialize_resource(resource, object, params)
    JSONAPI::ResourceSerializer.new(resource).serialize_to_hash(resource.new(object, params))
  end
end
