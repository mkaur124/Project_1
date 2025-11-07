Rails.application.routes.draw do
  get "pages/about"
  # Set the home page (you can change later)
  root "schools#index"

  # RESTful routes for schools, teachers, and students
  resources :schools do
    resources :teachers, only: [:index, :show]
  end

  resources :teachers do
    resources :students, only: [:index, :show]
  end

  resources :students, only: [:index, :show]

  # Health check (keep it)
  get "up" => "rails/health#show", as: :rails_health_check
end
