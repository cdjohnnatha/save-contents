# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      #Documentation
      resources :docs, only: [:index]
      resources :extractors, only: %i[index create]
      # post "/extractors", to: "extractors#create", as: "create_extractor"
      # get "/extractors", to: "extractors#index", as: "index_extractor"
    end
  end
end
