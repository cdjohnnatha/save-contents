# frozen_string_literal: true

require "rails_helper"

RSpec.describe Extractor, type: :model do
  let(:extractor) { create(:extractor) }

  it "should have a valid factory" do
    expect(build(:extractor)).to be_valid
  end

  describe "ActiveModel validations" do
    it "is invalid without a url" do
      expect(build(:extractor, url:nil)).to_not be_valid
    end

    it "is invalid with not existent url" do
      expect(build(:extractor, url: "httpa://aaabbb")).to_not be_valid
    end

    context "should require presence" do
      it { is_expected.to have_attribute :url }
    end
    context "relationships" do
      it { should have_many(:contents) }
    end
  end
end
