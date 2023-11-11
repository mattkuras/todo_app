Rails.application.routes.draw do
  get "up" => "rails/health#show", :as => :rails_health_check

  root "home#index"

  resources :todos, only: %i[index new]
  resource :auth, only: %i[show create destroy], controller: :auth
  resource :auth_verification, only: [:show, :create], controller: :auth_verification
end
