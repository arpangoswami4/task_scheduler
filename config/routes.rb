Rails.application.routes.draw do

  resources :tasks do
    collection do
      get 'user_tasks'
      # get 'user_tasks/page/:page', action: :user_tasks
      get "page/:page", action: :index
    end
  end

  get 'dashboard', to: "dashboard#index"
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "dashboard#index"
end
