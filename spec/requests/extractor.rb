# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Extractor", type: :request do
  let(:valid_attrs) { { data: { type: 'extractors', attributes: attributes_for(:extractor) } } .as_json }
  let(:invalid_attrs) { { data: { type: 'extractors', attributes: attributes_for(:extractor, url: '') } } .as_json }
  let(:invalid_attribute_attrs) { { data: { type: 'extractors', url: nil } } .as_json }

  describe "/v1/extractors" do
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
    end
    context "invalid extractor attributes" do
      before(:each) { post api_v1_create_extractor_path, params: invalid_attrs }

      it_behaves_like "a json error pattern"
      it_behaves_like "an unprocessable error"
    end
  end
end
