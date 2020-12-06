Rails.application.routes.draw do

  root 'home#show'

  get 'booking/:id/invoice/download', to: 'booking#send_invoice_pdf'

  get 'booking/show'
  get 'booking/export.csv', to: 'booking#download_as_csv', as: 'booking_export'
  post 'booking/:screen_id', to: 'home#booking', as: 'booking'

  resources :screenings
  resources :shows

  resources :sessions, only: [:new, :create, :destroy]
  resources :admin
  resources :movies

  get 'signup', to: 'admin#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as:'logout'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
