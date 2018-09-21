# frozen_string_literal: true

RSpec.shared_examples "a json pattern" do
  it "should be returns json pattern" do
    expect(json).not_to be_blank
    expect(json).not_to be_empty
    expect(json).to have_key("data")
    expect(json["data"]).to have_key("id")
    expect(json["data"]).to have_key("type")
    expect(json["data"]).to have_key("attributes")
  end
end

RSpec.shared_examples "a json error pattern" do
  it "should be returns json error pattern" do
    expect(json).not_to be_blank
    expect(json).not_to be_empty
    expect(json).to have_key("errors")
    expect(json["errors"][0]).to have_key("title")
    expect(json["errors"][0]).to have_key("detail")
    expect(json["errors"][0]).to have_key("id")
    expect(json["errors"][0]).to have_key("code")
    expect(json["errors"][0]["source"]).not_to be_empty
    expect(json["errors"][0]).to have_key("status")
  end
end
