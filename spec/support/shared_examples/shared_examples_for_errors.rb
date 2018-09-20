# frozen_string_literal: true

RSpec.shared_examples "an unprocessable error" do
  it "should be returns an unprocessable error" do
    expect(response).to have_http_status(422)
  end

  it "should be returns unprocessable fields" do
    expect(response.body).not_to be_blank
    expect(response.body).not_to be_empty
  end
end
