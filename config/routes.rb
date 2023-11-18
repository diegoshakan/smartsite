# frozen_string_literal: true

Rails.application.routes.draw do
  root "locations#index"

  resources :schedules
  resources :locations

  get "search", to: "locations#search"
end
