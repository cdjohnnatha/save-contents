# frozen_string_literal: true

require "rails_helper"

RSpec.describe Api::V1::ExtractorsController, type: :routing do

  describe "routing" do

    it "routes to #create" do
     expect(post: "/api/v1/extractors").to route_to("api/v1/extractors#create")
   end
  end
end
