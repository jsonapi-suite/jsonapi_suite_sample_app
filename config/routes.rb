Rails.application.routes.draw do
  scope path: '/api' do
    resources :employees
  end
end
