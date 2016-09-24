Rails.application.routes.draw do
  scope path: '/api' do
    resources :employees
    resources :departments, only: [:index]
  end
end
