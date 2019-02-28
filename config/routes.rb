Rails.application.routes.draw do
  # require 'sidekiq/web'
  # mount Sidekiq::Web => '/sidekiq'
  get 'healthcheck', to: 'application#healthcheck'

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :bot, only: [:create]
    end
  end
end
