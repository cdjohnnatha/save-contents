# frozen_string_literal: true

FactoryBot.define do
  factory :content do
      tag { 'h_family' }
      content { Faker::Lorem.sentence(3) }

    trait :link do
      tag { 'link' }
      content { Faker::Internet.url }
    end
  end
end
