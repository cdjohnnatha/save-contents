# frozen_string_literal: true

require "rails_helper"

RSpec.describe Content, type: :model do

  it "should have a valid factory" do
    expect(build(:extractor)).to be_valid
  end

  describe "ActiveModel validations" do
    context "should require presence" do
      it { is_expected.to have_attribute :tag }
      it { is_expected.to have_attribute :content }
    end

    context "should be invalid" do
      it "is invalid without a url" do
        expect(build(:content, tag:nil)).to_not be_valid
      end
      it "is invalid with not existent url" do
        expect(build(:content, content: nil)).to_not be_valid
      end
    end
    context "relationships" do
      it { should belong_to(:extractor) }
    end
  end
end
