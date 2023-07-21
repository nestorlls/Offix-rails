Rails.application.routes.draw do
  root to: "departments#index"
  resources :departments
  resources :employees, only: %i[new create edit destroy]
end
