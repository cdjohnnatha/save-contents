# frozen_string_literal: true

require "rails_helper"

RSpec.describe Api::V1::DocsController, type: :routing do

  describe "routing" do

    it "routes to #get" do
     expect(get: "/api/v1/docs").to route_to("api/v1/docs#index")
   end
  end
end
