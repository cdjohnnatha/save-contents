# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Extractor", type: :request do
  let(:valid_attrs) { { data: { type: 'extractors', attributes: attributes_for(:extractor) } } .as_json }
  let(:invalid_attrs) { { data: { type: 'extractors', attributes: nil } } .as_json }
  let(:invalid_attribute_attrs) { { data: { type: 'extractors', url: nil } } .as_json }

  describe "/v1/products" do
    context "POST" do
      context "valid extractor attributes" do
        before(:each) { post api_v1_create_extractor_path, params: valid_attrs }

        it "should return a created extractor" do
          expect(response).to have_http_status(201)
          expect(response).to be_success
        end

        it "validate serializer" do
          expect(json).to match_response_schema("extractor")
        end

        it_behaves_like "a extractor attributes" do
          let(:body) { json }
          let(:attrs) { valid_attrs }
        end
      end

      # context "invalid product attributes" do
      #   before(:each) { post api_v1_create_extractor_path, params: invalid_attrs }

      #   it_behaves_like "a unprocessable error", :products
      # end

      # context "when logged out" do
      #   before(:each) { post v1_products_path, params: valid_attrs }

      #   it_behaves_like "a unauthorized error"
      # end
    end
  end
end
