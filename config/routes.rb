Rails.application.routes.draw do
  root 'pages#home'
  get 'about', to: 'pages#about'

  # User
  get  'sign_up', to: 'registrations#new'
  post 'sign_up', to: 'registrations#create'

  delete 'logout',  to: 'sessions#destroy'
  #
end
