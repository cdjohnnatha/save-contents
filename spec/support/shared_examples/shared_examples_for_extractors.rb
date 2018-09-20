# frozen_string_literal: true

RSpec.shared_examples "a extractor attributes" do
  it "should be returns a extractor attributes" do
    expect(json["data"]).not_to be_blank
    expect(json["data"]).not_to be_empty
    expect(json["data"]["attributes"]["url"]).to eq(attrs["data"]["attributes"]["url"])
  end
end
