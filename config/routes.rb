# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      #Documentation
      resources :docs, only: [:index]
      resources :extractors, only: %i[index create]
    end
  end
end
