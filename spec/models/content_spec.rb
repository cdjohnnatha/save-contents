# frozen_string_literal: true

require "rails_helper"

RSpec.describe Content, type: :model do
  describe "ActiveModel validations" do
    context "should require presence" do
      it { is_expected.to have_attribute :tag }
      it { is_expected.to have_attribute :content }
    end
    context "relationships" do
      it { should belong_to(:extractor) }
    end
  end
end
