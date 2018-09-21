# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      #Documentation
      resources :docs, only: [:index]

      post "/extractors", to: "extractors#create", as: "create_extractor"
      get "/extractors", to: "extractors#index", as: "index_extractor"
      # jsonapi_resources :extractors, only: [:index, :create]
    end
  end
end
