# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post "/extractors", to: "extractors#create", as: "create_extractor"
      # jsonapi_resources :extractors
    end
  end
end
