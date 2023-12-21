Rails.application.routes.draw do
  root 'accounts#show'
  devise_for :accounts, controllers: { registrations: 'registrations' }
  resources :accounts
  resources :tickets do
    member do
      post 'send_to_1_line'
    end
  end
end
