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

  swagger_schema :ExtractorInclude do
        key :required, [:data]

        property :data do
              key :format, :object
              key :required, [:id, :type, :links]

              property :id do
                key :type, :integer
              end

              property :type do
                key :type, :string
              end

              property :links do
                key :format, :object
                key :required, [:self]
                property :self do
                  key :type, :string
                end
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

              property :relationships do

                    key :format, :object
                    key :required, [:contents]

                    property :contents do
                      key :format, :object
                      key :required, [:links, :data]
                      property :links do
                        key :format, :object
                        key :required, [:links]
                        property :self do
                          key :type, :string
                        end
                        property :related do
                          key :type, :string
                        end
                      end
                      property :data do
                        key :format, :array
                        items do
                          key :required, [:type, :id]
                          property :type do
                            key :type, :string
                          end
                          property :id do
                            key :type, :number
                          end
                        end
                      end
                    end
                    property :included do
                          key :format, :array
                          items do
                                key :required, [:type, :id, :links, :attributes, :relationships]
                                property :id do
                                  key :type, :number
                                end

                                property :type do
                                  key :type, :string
                                end

                                property :links do
                                  key :type, :string
                                end

                                property :attributes do
                                  key :format, :object
                                  key :required, [:tag, :content]
                                  property :tag do
                                    key :type, :string
                                  end
                                  property :content do
                                    key :type, :string
                                  end
                                end #end of attributes

                                property :relationships do
                                      key :format, :object
                                      key :required, [:extractor]
                                      property :extractor do
                                            key :format, :object
                                            key :required, [:links]
                                            property :links do
                                                key :format, :object
                                                key :required, [:links]
                                                property :self
                                                key :type, :string
                                              end
                                            property :related
                                            key :type, :string
                                          end
                                    end
                              end
                        end #end of relationships
                  end #end of array
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
