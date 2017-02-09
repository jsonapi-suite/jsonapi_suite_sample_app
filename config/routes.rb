Rails.application.routes.draw do
  scope path: '/api' do
    resources :employees
    resources :departments, only: [:index, :show]
    resources :goals, only: [:index, :show]
  end
end
