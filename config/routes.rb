Rails.application.routes.draw do
  root 'accounts#show'
  devise_for :accounts, controllers: { registrations: 'registrations' }
  resources :accounts
  resources :tickets
  resources :ticket_tasks
end
