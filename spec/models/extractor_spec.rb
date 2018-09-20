# frozen_string_literal: true

require "rails_helper"

RSpec.describe Extractor, type: :model do
  it "should have a valid factory" do
    expect(build(:extractor)).to be_valid
  end

  describe "ActiveModel validations" do
    context "should require presence" do
      it { is_expected.to have_attribute :url }
    end
  end
  #   # context "relationships" do
  #   #   it { should have_many(:supermarket_products) }
  #   #   it { should have_many(:supermarkets).through(:supermarket_products) }
  #   # end
  # end
end
