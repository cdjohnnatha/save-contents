# frozen_string_literal: true

FactoryBot.define do
  factory :extractor do
    url { Faker::Internet.url }
  end
end
