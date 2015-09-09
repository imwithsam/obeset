Rails.application.routes.draw do
  root "schools#index"

  resources :schools
  resources :counties, only: [:index, :show]
end
